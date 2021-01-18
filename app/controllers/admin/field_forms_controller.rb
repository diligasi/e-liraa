class Admin::FieldFormsController < Admin::AdminController
  load_and_authorize_resource

  before_action :set_admin_field_form, only: %i[show edit update]

  # GET /admin/field_forms
  # GET /admin/field_forms.json
  def index
    @admin_field_forms = FieldForm.includes(:test_tubes, :user)
    @admin_field_forms = @admin_field_forms.where(users: { departament_id: current_admin_user.departament_id }) unless current_admin_user.admin?
    @admin_field_forms = @admin_field_forms.order('users.departament_id desc, field_forms.created_at, field_forms.status').page(page).per(per_page)
  end

  # GET /admin/field_forms/1
  # GET /admin/field_forms/1.json
  def show; end

  # GET /admin/field_forms/1/edit
  def edit; end

  # PATCH/PUT /admin/field_forms/1
  # PATCH/PUT /admin/field_forms/1.json
  def update
    respond_to do |format|
      if @admin_field_form.update(field_form_params)
        format.html { redirect_to admin_field_form_path(@admin_field_form), notice: 'Ficha de campo atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_field_form }
      else
        format.html { render :edit }
        format.json { render json: @admin_field_form.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_admin_field_form
    @admin_field_form = FieldForm.find(params[:id])
  end

  def field_form_params
    params.require(:field_form).permit(:name, :description)
  end
end
