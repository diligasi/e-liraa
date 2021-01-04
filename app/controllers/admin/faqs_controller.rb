class Admin::FaqsController < Admin::AdminController
  load_and_authorize_resource

  before_action :set_admin_faq, only: [:show, :edit, :update, :destroy]

  # GET /admin/faqs
  # GET /admin/faqs.json
  def index
    @admin_faqs = Faq.order(:id).page(page).per(per_page)
  end

  # GET /admin/faqs/1
  # GET /admin/faqs/1.json
  def show
  end

  # GET /admin/faqs/new
  def new
    @admin_faq = Faq.new
  end

  # GET /admin/faqs/1/edit
  def edit
  end

  # POST /admin/faqs
  # POST /admin/faqs.json
  def create
    @admin_faq = Faq.new(faq_params)

    respond_to do |format|
      if @admin_faq.save
        format.html { redirect_to admin_faq_path(@admin_faq), notice: 'FAQ com sucesso.' }
        format.json { render :show, status: :created, location: @admin_faq }
      else
        format.html { render :new }
        format.json { render json: @admin_faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/faqs/1
  # PATCH/PUT /admin/faqs/1.json
  def update
    respond_to do |format|
      if @admin_faq.update(faq_params)
        format.html { redirect_to admin_faq_path(@admin_faq), notice: 'FAQ atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @admin_faq }
      else
        format.html { render :edit }
        format.json { render json: @admin_faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/faqs/1
  # DELETE /admin/faqs/1.json
  def destroy
    @admin_faq.destroy
    respond_to do |format|
      format.html { redirect_to admin_faqs_url, notice: 'FAQ apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_faq
    @admin_faq = Faq.find(params[:id])
  end

  def faq_params
    params.require(:faq).permit(:question, :answer)
  end
end
