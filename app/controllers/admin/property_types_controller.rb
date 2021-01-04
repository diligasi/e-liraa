class Admin::PropertyTypesController < Admin::AdminController
  load_and_authorize_resource

  before_action :set_admin_property_type, only: [:show, :edit, :update, :destroy]

  # GET /admin/property_types
  # GET /admin/property_types.json
  def index
    @admin_property_types = PropertyType.order(:name).page(page).per(per_page)
  end

  # GET /admin/property_types/1
  # GET /admin/property_types/1.json
  def show
  end

  # GET /admin/property_types/new
  def new
    @admin_property_type = PropertyType.new
  end

  # GET /admin/property_types/1/edit
  def edit
  end

  # POST /admin/property_types
  # POST /admin/property_types.json
  def create
    @admin_property_type = PropertyType.new(property_type_params)

    respond_to do |format|
      if @admin_property_type.save
        format.html { redirect_to admin_property_type_path(@admin_property_type), notice: 'Tipo de imóvel criado com sucesso.' }
        format.json { render :show, status: :created, location: @admin_property_type }
      else
        format.html { render :new }
        format.json { render json: @admin_property_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/property_types/1
  # PATCH/PUT /admin/property_types/1.json
  def update
    respond_to do |format|
      if @admin_property_type.update(property_type_params)
        format.html { redirect_to admin_property_type_path(@admin_property_type), notice: 'Tipo de imóvel atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_property_type }
      else
        format.html { render :edit }
        format.json { render json: @admin_property_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/property_types/1
  # DELETE /admin/property_types/1.json
  def destroy
    @admin_property_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_property_types_url, notice: 'Tipo de imóvel apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_property_type
    @admin_property_type = PropertyType.find(params[:id])
  end

  def property_type_params
    params.require(:property_type).permit(:name, :description)
  end
end
