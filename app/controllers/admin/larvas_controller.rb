class Admin::LarvasController < Admin::AdminController
  load_and_authorize_resource

  before_action :set_admin_larva, only: [:update, :destroy]

  # POST /admin/larvas
  # POST /admin/larvas.json
  def create
    @admin_larva = Larva.new(larva_params)

    respond_to do |format|
      if @admin_larva.save
        format.html { redirect_to admin_field_form_path(@admin_larva.test_tube.field_form), notice: 'Espécie adicionado com sucesso.' }
        format.json { head :no_content }
        # format.html { redirect_to admin_larva_path(@admin_larva), notice: 'Espécie adicionado com sucesso.' }
        # format.json { render :show, status: :created, location: @admin_larva }
      else
        format.html { render :new }
        format.json { render json: @admin_larva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/larvas/1
  # PATCH/PUT /admin/larvas/1.json
  def update
    respond_to do |format|
      if @admin_larva.update(larva_params)
        format.html { redirect_to admin_larva_path(@admin_larva), notice: 'Analise atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_larva }
      else
        format.html { render :edit }
        format.json { render json: @admin_larva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/larvas/1
  # DELETE /admin/larvas/1.json
  def destroy
    @admin_larva.destroy
    respond_to do |format|
      format.html { redirect_to admin_larvas_url, notice: 'Analise apagada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_larva
    @admin_larva = Larva.find(params[:id])
  end

  def larva_params
    params.require(:larva).permit(:test_tube_id, :larva_specy_id, :block, :comments)
  end
end
