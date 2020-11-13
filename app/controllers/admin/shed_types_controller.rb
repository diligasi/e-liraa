class Admin::ShedTypesController < Admin::AdminController
  before_action :set_admin_shed_type, only: [:show, :edit, :update, :destroy]

  # GET /admin/shed_types
  # GET /admin/shed_types.json
  def index
    @admin_shed_types = ShedType.order(:name).page(page).per(per_page)
  end

  # GET /admin/shed_types/1
  # GET /admin/shed_types/1.json
  def show
  end

  # GET /admin/shed_types/new
  def new
    @admin_shed_type = ShedType.new
  end

  # GET /admin/shed_types/1/edit
  def edit
  end

  # POST /admin/shed_types
  # POST /admin/shed_types.json
  def create
    @admin_shed_type = ShedType.new(shed_type_params)

    respond_to do |format|
      if @admin_shed_type.save
        format.html { redirect_to admin_shed_type_path(@admin_shed_type), notice: 'Local de coleta criada com sucesso.' }
        format.json { render :show, status: :created, location: @admin_shed_type }
      else
        format.html { render :new }
        format.json { render json: @admin_shed_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/shed_types/1
  # PATCH/PUT /admin/shed_types/1.json
  def update
    respond_to do |format|
      if @admin_shed_type.update(shed_type_params)
        format.html { redirect_to admin_shed_type_path(@admin_shed_type), notice: 'Local de coleta atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_shed_type }
      else
        format.html { render :edit }
        format.json { render json: @admin_shed_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/shed_types/1
  # DELETE /admin/shed_types/1.json
  def destroy
    @admin_shed_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_shed_types_url, notice: 'Local de coleta apagada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_shed_type
    @admin_shed_type = ShedType.find(params[:id])
  end

  def shed_type_params
    params.require(:shed_type).permit(:name, :description)
  end
end
