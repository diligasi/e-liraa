class Pwa::FieldFormsController < Pwa::PwaController
  before_action :set_pwa_field_form, only: %i[show edit update]

  # GET /pwa/field_forms
  # GET /pwa/field_forms.json
  def index
    @pwa_field_forms = FieldForm.includes(:test_tubes).order(:created_at, :status).page(page).per(per_page)
  end

  # GET /pwa/field_forms/1
  # GET /pwa/field_forms/1.json
  def show; end

  # GET /pwa/field_forms/1/edit
  def edit; end

  # POST /pwa/field_forms
  # POST /pwa/field_forms.json
  def create
    @pwa_field_form = FieldForm.new(field_form_params)

    respond_to do |format|
      if @pwa_field_form.save
        format.html { redirect_to pwa_field_form_path(@pwa_field_form), notice: 'Ficha criada com sucesso.' }
        format.json { render :show, status: :created, location: @pwa_field_form }
      else
        format.html { render :new }
        format.json { render json: @pwa_field_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pwa/field_forms/1
  # PATCH/PUT /pwa/field_forms/1.json
  def update
    respond_to do |format|
      if @pwa_field_form.update(field_form_params)
        format.html { redirect_to pwa_field_form_path(@pwa_field_form), notice: 'Ficha de campo atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @pwa_field_form }
      else
        format.html { render :edit }
        format.json { render json: @pwa_field_form.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_pwa_field_form
    @pwa_field_form = FieldForm.find(params[:id])
  end

  def field_form_params
    params.require(:field_form).permit(:name, :description)
  end
end
