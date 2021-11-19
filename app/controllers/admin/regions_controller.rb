class Admin::RegionsController < Admin::AdminController
  load_and_authorize_resource

  before_action :set_admin_region, only: [:show, :edit, :update, :destroy]

  # GET /admin/regions
  # GET /admin/regions.json
  def index
    @admin_regions = Region.order(:name).page(page).per(per_page)
  end

  # GET /admin/regions/1
  # GET /admin/regions/1.json
  def show
  end

  # GET /admin/regions/new
  def new
    @admin_region = Region.new
  end

  # GET /admin/regions/1/edit
  def edit
  end

  # POST /admin/regions
  # POST /admin/regions.json
  def create
    @admin_region = Region.new(region_params)

    respond_to do |format|
      if @admin_region.save
        format.html { redirect_to admin_region_path(@admin_region), notice: 'Região criada com sucesso.' }
        format.json { render :show, status: :created, location: @admin_region }
      else
        format.html { render :new }
        format.json { render json: @admin_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/regions/1
  # PATCH/PUT /admin/regions/1.json
  def update
    respond_to do |format|
      if @admin_region.update(region_params)
        format.html { redirect_to admin_region_path(@admin_region), notice: 'Região atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_region }
      else
        format.html { render :edit }
        format.json { render json: @admin_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/regions/1
  # DELETE /admin/regions/1.json
  def destroy
    @admin_region.destroy
    respond_to do |format|
      format.html { redirect_to admin_regions_url, notice: 'Região apagada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_region
    @admin_region = Region.find(params[:id])
  end

  def region_params
    params.require(:region).permit(:name, :department_id)
  end
end
