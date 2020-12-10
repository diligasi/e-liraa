class Pwa::UsersController < Pwa::PwaController
  before_action :set_pwa_user, only: %i[show edit update]

  # GET /app/users/1
  # GET /app/users/1.json
  def show; end

  # GET /app/users/1/edit
  def edit; end

  # PATCH/PUT /app/users/1
  # PATCH/PUT /app/users/1.json
  def update
    respond_to do |format|
      if @pwa_user.update(user_params)
        format.html { redirect_to user_path(@pwa_user), notice: 'Usuário atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @pwa_user }
      else
        format.html { render :edit }
        format.json { render json: @pwa_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_pwa_user
    @pwa_user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
