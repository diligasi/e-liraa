class Pwa::FieldFormsController < Pwa::PwaController
  before_action :set_pwa_field_form, only: %i[show edit update]

  # GET /app/field_forms
  # GET /app/field_forms.json
  def index
    date_range = Date.today.beginning_of_month..Date.today.end_of_month
    @pwa_field_forms = FieldForm.includes(:test_tubes)
                                .where(create_at: date_range)
                                .order(:created_at, :status)
                                .page(page).per(per_page)
  end

  # GET /app/field_forms/1
  # GET /app/field_forms/1.json
  def show; end

  # GET /app/field_forms/new
  def new
    @pwa_field_form = FieldForm.new
  end

  # GET /app/field_forms/1/edit
  def edit; end

  # POST /app/field_forms
  # POST /app/field_forms.json
  def create
    result = false
    @pwa_field_form = FieldForm.new(field_form_params)
    test_tubes_group = test_tubes_params

    ActiveRecord::Base.transaction do
      unless test_tubes_group['test_tubes'].blank?
        JSON.parse(test_tubes_group['test_tubes']).each do |tube|
          @pwa_field_form.test_tubes << TestTube.new(tube.except('shed_type_name'))
        end
      end

      result = true if @pwa_field_form.save
    end

    respond_to do |format|
      if result
        format.html { redirect_to field_form_path(@pwa_field_form), notice: 'Ficha criada com sucesso.' }
        format.json { render :show, status: :created, location: @pwa_field_form }
      else
        format.html { render :new }
        format.json { render json: @pwa_field_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app/field_forms/1
  # PATCH/PUT /app/field_forms/1.json
  def update
    result = false
    test_tubes_group = test_tubes_params

    ActiveRecord::Base.transaction do
      @pwa_field_form.test_tubes.destroy_all
      unless test_tubes_group['test_tubes'].blank?
        JSON.parse(test_tubes_group['test_tubes']).each do |tube|
          @pwa_field_form.test_tubes << TestTube.new(tube.except('shed_type_name'))
        end
      end

      result = true if @pwa_field_form.update(field_form_params)
    end

    respond_to do |format|
      if result
        format.html { redirect_to field_form_path(@pwa_field_form), notice: 'Ficha de campo atualizada com sucesso.' }
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
    params.require(:field_form).permit(:user_id, :status, :street, :number, :complement, :district, :city, :state,
                                       :country, :zipcode, :property_type_id, :visit_status, :visit_comment,
                                       :larvae_found, :larvicide, :rodenticide)
  end

  def test_tubes_params
    params.require(:field_form).permit(:test_tubes)
  end
end
