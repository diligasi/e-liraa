class Admin::DashboardController < Admin::AdminController
  authorize_resource class: false

  before_action :basic_dashboard_objects, only: %i[index]

  # GET /admin/dashboard
  # GET /admin/dashboard.json
  def index
    # N de Imóveis Trabalhados;             ✔
    # N de Imóveis Trabalhados c Foco;      ✔
    # N de Imóveis tratados c Larvicida;
    # N de Imóveis Fechados;                ✔
    # N de Visitas Recusadas                ✔
    # N de Imóveis Recuperados
    # N de Imóveis Recuperados  c Foco
    # N de Imóveis Recuperados tratados c Larvicida
    # Observações

    @total_visits      = @field_forms.size
    @clean             = @field_forms.where(larvae_found: false, visit_status: :allowed).size
    @with_larvae       = @field_forms.where(larvae_found: true).size
    @closed_or_refused = @field_forms.where(visit_status: %i[refused closed_location]).size

    @number_of_larvae_per_region = @test_tubes.group('regions.name').sum('test_tubes.collected_amount')
    @species_by_region           = @region.group_by { |hsh| hsh[:region].itself }
                                          .map do |key, val|
                                            { name: key, data: val.map do |q|
                                              { q.name => q.count }
                                            end.reduce({}, :merge) }
                                          end

    @property_types      = @field_forms.group(:property_type).count.transform_keys { |k| k.nil? ? 'Sem tipo definido' : k.name }
    @contaminated_places = @shed_types.group_by { |hsh| hsh[:region].itself }
                                      .map do |key, val|
                                        { name: key, data: val.map do |q|
                                          { q.name => q.count }
                                        end.reduce({}, :merge) }
                                      end
  end

  # GET /admin/export
  def export
    ExportJob.perform_later(params[:export_id])

    head :accepted
  end

  private

  def basic_dashboard_objects
    @field_forms = FieldForm.left_outer_joins(:test_tubes, user: [region: [:department]]).where(base_condition)
    @test_tubes  = TestTube.joins(field_form: [user: [region: [:department]]]).where(base_condition).order('regions.name')
    @region      = Region.joins('left outer join departments on departments.id = regions.department_id
                                 left outer join users on users.region_id = regions.id
                                 left outer join field_forms on field_forms.user_id = users.id
                                 right outer join test_tubes on test_tubes.field_form_id = field_forms.id
                                 right outer join larvas on larvas.test_tube_id = test_tubes.id
                                 right outer join larva_species on larva_species.id = larvas.larva_specy_id')
                         .group('regions.name, larva_species.name')
                         .select('regions.name as "region", larva_species.name, count(larva_species.*)')
                         .order('regions.name')

    @shed_types = ShedType.joins('left outer join test_tubes on test_tubes.shed_type_id = shed_types.id
                                 left outer join field_forms on field_forms.id = test_tubes.field_form_id
                                 left outer join users on users.id = field_forms.user_id
                                 right outer join regions on regions.id = users.region_id
                                 right outer join departments on departments.id = regions.department_id')
                          .group('regions.name, shed_types.name')
                          .select('regions.name as "region", shed_types.name, count(test_tubes.*)')
                          .order('regions.name')
  end

  def base_condition
    condition_for_non_admin = current_admin_user.admin? ? '' : " and departments.id = #{current_admin_user.region&.department&.id}"

    "extract(month from field_forms.created_at) = #{DateTime.now.strftime('%m')} #{condition_for_non_admin}"
  end
end
