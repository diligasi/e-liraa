class Admin::DepartamentsController < Admin::AdminController
  load_and_authorize_resource

  before_action :set_admin_departament, only: [:show, :edit, :update, :destroy]

  # GET /admin/departaments
  # GET /admin/departaments.json
  def index
    @admin_departaments = Departament.order(:name).page(page).per(per_page)
  end

  # GET /admin/departaments/1
  # GET /admin/departaments/1.json
  def show
  end

  # GET /admin/departaments/new
  def new
    @admin_departament = Departament.new
  end

  # GET /admin/departaments/1/edit
  def edit
  end

  # POST /admin/departaments
  # POST /admin/departaments.json
  def create
    @admin_departament = Departament.new(departament_params)

    respond_to do |format|
      if @admin_departament.save
        format.html { redirect_to admin_departament_path(@admin_departament), notice: 'Secretaria criada com sucesso.' }
        format.json { render :show, status: :created, location: @admin_departament }
      else
        format.html { render :new }
        format.json { render json: @admin_departament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/departaments/1
  # PATCH/PUT /admin/departaments/1.json
  def update
    respond_to do |format|
      if @admin_departament.update(departament_params)
        format.html { redirect_to admin_departament_path(@admin_departament), notice: 'Secretaria atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_departament }
      else
        format.html { render :edit }
        format.json { render json: @admin_departament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/departaments/1
  # DELETE /admin/departaments/1.json
  def destroy
    @admin_departament.destroy
    respond_to do |format|
      format.html { redirect_to admin_departaments_url, notice: 'Secretaria apagada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_departament
    @admin_departament = Departament.find(params[:id])
  end

  def departament_params
    params.require(:departament).permit(:name, :description)
  end
end
