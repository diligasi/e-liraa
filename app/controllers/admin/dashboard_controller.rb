class Admin::DashboardController < Admin::AdminController
  authorize_resource class: false

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

    # User.where('extract(month from created_at)=?', DateTime.now.strftime('%m'))

    # @total_visits = 65
    # @closed_or_refused = 8
    # @with_larvae = 13
    # @clean = 44

    current_field_forms = FieldForm.where('extract(month from created_at)=?', DateTime.now.strftime('%m'))

    @total_visits      = current_field_forms.size
    @closed_or_refused = current_field_forms.where(visit_status: %i[refused closed_location]).size
    @with_larvae       = current_field_forms.where(larvae_found: true).size
    @clean             = current_field_forms.where(larvae_found: false, visit_status: :allowed).size

    @property_types = current_field_forms.group(:property_type).count.transform_keys { |k| k.nil? ? 'Sem tipo definido' : k.name }
  end
end
