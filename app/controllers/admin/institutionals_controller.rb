class Admin::InstitutionalsController < Admin::AdminController
  before_action :set_admin_institutional, only: [:show, :edit, :update, :destroy]

  # GET /admin/institutionals
  # GET /admin/institutionals.json
  def index
    @admin_institutional = Institutional.first
  end

  # GET /admin/institutionals/1
  # GET /admin/institutionals/1.json
  def show; end

  # GET /admin/institutionals/new
  def new
    @admin_institutional = Institutional.new
  end

  # GET /admin/institutionals/1/edit
  def edit; end

  # POST /admin/institutionals
  # POST /admin/institutionals.json
  def create
    @admin_institutional = Institutional.new(institutional_params)

    respond_to do |format|
      if @admin_institutional.save
        format.html { redirect_to admin_institutional_path(@admin_institutional), notice: 'Informações adicionadas com sucesso.' }
        format.json { render :show, status: :created, location: @admin_institutional }
      else
        format.html { render :new }
        format.json { render json: @admin_institutional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/institutionals/1
  # PATCH/PUT /admin/institutionals/1.json
  def update
    respond_to do |format|
      if @admin_institutional.update(institutional_params)
        format.html { redirect_to admin_institutional_path(@admin_institutional), notice: 'Informações atualizadas com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_institutional }
      else
        format.html { render :edit }
        format.json { render json: @admin_institutional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/institutionals/1
  # DELETE /admin/institutionals/1.json
  def destroy
    @admin_institutional.destroy
    respond_to do |format|
      format.html { redirect_to admin_institutionals_url, notice: 'Informações apagadas com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_institutional
    @admin_institutional = Institutional.find(params[:id])
  end

  def institutional_params
    params.require(:institutional).permit(:description, :phone_numbers)
  end
end
