class Admin::DashboardController < Admin::AdminController
  authorize_resource class: false

  before_action :dashboard_and_filter_objects, only: %i[index filter_dashboard_by_date_range]

  # GET /admin/dashboard
  # GET /admin/dashboard.json
  def index; end

  # GET /admin/filter_dashboard_by_date_range
  # GET /admin/filter_dashboard_by_date_range.json
  def filter_dashboard_by_date_range; end

  # GET /admin/export
  def export
    ExportJob.perform_later(params[:export_id])

    head :accepted
  end

  private

  def dashboard_and_filter_objects
    # N de Imóveis Trabalhados;             ✔
    # N de Imóveis Trabalhados c Foco;      ✔
    # N de Imóveis tratados c Larvicida;
    # N de Imóveis Fechados;                ✔
    # N de Visitas Recusadas                ✔
    # N de Imóveis Recuperados
    # N de Imóveis Recuperados  c Foco
    # N de Imóveis Recuperados tratados c Larvicida
    # Observações

    field_forms_base_query = FieldForm.by_dashboard_range(base_condition)
    shed_type_base_query   = ShedType.contaminated_places_per_range(base_condition)

    @total_visits      = field_forms_base_query.size
    @clean             = field_forms_base_query.find_all { |ff| !ff.larvae_found and ff.visit_status == 'allowed' }.size
    @with_larvae       = field_forms_base_query.find_all(&:larvae_found).size
    @closed_or_refused = field_forms_base_query.find_all { |ff| ff.visit_status == 'refused' or ff.visit_status == 'closed_location' }.size

    @contaminated_places = shed_type_base_query.group_by { |hsh| hsh[:place].itself }
                                               .map do |key, val|
                                                 { name: key, data: val.map do |q|
                                                   { q.property => q.count }
                                                 end.reduce({}, :merge) }
                                               end

    @number_of_larvae_per_region = TestTube.total_larvae_per_region_range(base_condition)
                                           .group_by { |hsh| hsh[:region].itself }
                                           .map { |key, val| { key => val[0].sum } }
                                           .reduce({}, :merge)

    @property_types = PropertyType.visited_per_range(base_condition)
                                  .group_by { |hsh| hsh[:name].itself }
                                  .map { |key, val| { key => val[0].count } }
                                  .reduce({}, :merge)

    @number_of_larvae_per_shed_type = shed_type_base_query.group_by { |hsh| hsh[:property].itself }
                                                          .map { |key, val| { key => val.size } }
                                                          .reduce({}, :merge)

    @species_per_region = LarvaSpecy.species_by_region_per_range(base_condition)
                                    .group_by { |hsh| hsh[:specie].itself }
                                    .map do |key, val|
                                      { name: key, data: val.map do |q|
                                        { q.region => q.count }
                                      end.reduce({}, :merge) }
                                    end
  end

  def base_condition
    condition_hash = { field_forms: { created_at: base_date_range } }
    condition_hash[:departments] = { id: current_admin_user.region&.department&.id } unless current_admin_user.admin?

    condition_hash
  end

  def base_date_range
    if params[:start].present? && params[:end].present?
      return params[:start].to_datetime.beginning_of_day..params[:end].to_datetime.end_of_day
    end

    DateTime.now.beginning_of_month..DateTime.now.end_of_month
  end
end
