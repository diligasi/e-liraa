class Admin::UsersController < Admin::AdminController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  # GET /admin/users.json
  def index
    @admin_users = User.order(:role, :id).page(page).per(per_page)
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @admin_user = User.new
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @admin_user = User.new(user_params)
    @admin_user.password = SecureRandom.urlsafe_base64(10, false)

    respond_to do |format|
      if @admin_user.save
        @admin_user.send_reset_password_instructions
        format.html { redirect_to admin_user_path(@admin_user), notice: 'Usuário criado com sucesso.' }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if @admin_user.update(user_params)
        format.html { redirect_to admin_user_path(@admin_user), notice: 'Usuário atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_user }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_user
    @admin_user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :cpf, :email, :status, :role)
  end
end
