class Admin::LarvaSpeciesController < Admin::AdminController
  load_and_authorize_resource

  before_action :set_admin_larva_specy, only: [:show, :edit, :update, :destroy]

  # GET /admin/larva_species
  # GET /admin/larva_species.json
  def index
    @admin_larva_species = LarvaSpecy.order(:name).page(page).per(per_page)
  end

  # GET /admin/larva_species/1
  # GET /admin/larva_species/1.json
  def show
  end

  # GET /admin/larva_species/new
  def new
    @admin_larva_specy = LarvaSpecy.new
  end

  # GET /admin/larva_species/1/edit
  def edit
  end

  # POST /admin/larva_species
  # POST /admin/larva_species.json
  def create
    @admin_larva_specy = LarvaSpecy.new(larva_specy_params)

    respond_to do |format|
      if @admin_larva_specy.save
        format.html { redirect_to admin_larva_specy_path(@admin_larva_specy), notice: 'Espécie criada com sucesso.' }
        format.json { render :show, status: :created, location: @admin_larva_specy }
      else
        format.html { render :new }
        format.json { render json: @admin_larva_specy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/larva_species/1
  # PATCH/PUT /admin/larva_species/1.json
  def update
    respond_to do |format|
      if @admin_larva_specy.update(larva_specy_params)
        format.html { redirect_to admin_larva_specy_path(@admin_larva_specy), notice: 'Espécie atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_larva_specy }
      else
        format.html { render :edit }
        format.json { render json: @admin_larva_specy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/larva_species/1
  # DELETE /admin/larva_species/1.json
  def destroy
    @admin_larva_specy.destroy
    respond_to do |format|
      format.html { redirect_to admin_larva_species_url, notice: 'Espécie apagada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_larva_specy
    @admin_larva_specy = LarvaSpecy.find(params[:id])
  end

  def larva_specy_params
    params.require(:larva_specy).permit(:name, :description)
  end
end
