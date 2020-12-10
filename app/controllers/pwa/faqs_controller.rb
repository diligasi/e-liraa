class Pwa::FaqsController < Pwa::PwaController

  # GET /app/faqs
  # GET /app/faqs.json
  def index
    @pwa_faqs = Faq.order(:id)
  end
end
