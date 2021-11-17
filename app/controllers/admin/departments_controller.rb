class Admin::DepartmentsController < Admin::AdminController
  load_and_authorize_resource

  before_action :set_admin_department, only: [:show, :edit, :update, :destroy]

  # GET /admin/departments
  # GET /admin/departments.json
  def index
    @admin_departments = Department.order(:name).page(page).per(per_page)
  end

  # GET /admin/departments/1
  # GET /admin/departments/1.json
  def show
  end

  # GET /admin/departments/new
  def new
    @admin_department = Department.new
  end

  # GET /admin/departments/1/edit
  def edit
  end

  # POST /admin/departments
  # POST /admin/departments.json
  def create
    @admin_department = Department.new(department_params)

    respond_to do |format|
      if @admin_department.save
        format.html { redirect_to admin_department_path(@admin_department), notice: 'Secretaria criada com sucesso.' }
        format.json { render :show, status: :created, location: @admin_department }
      else
        format.html { render :new }
        format.json { render json: @admin_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/departments/1
  # PATCH/PUT /admin/departments/1.json
  def update
    respond_to do |format|
      if @admin_department.update(department_params)
        format.html { redirect_to admin_department_path(@admin_department), notice: 'Secretaria atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_department }
      else
        format.html { render :edit }
        format.json { render json: @admin_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/departments/1
  # DELETE /admin/departments/1.json
  def destroy
    @admin_department.destroy
    respond_to do |format|
      format.html { redirect_to admin_departments_url, notice: 'Secretaria apagada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_department
    @admin_department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name, :description)
  end
end
