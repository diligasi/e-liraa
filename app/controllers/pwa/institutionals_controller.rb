class Pwa::InstitutionalsController < Pwa::PwaController

  # GET /app/institutionals
  # GET /app/institutionals.json
  def index
    @pwa_institutional = Institutional.first
  end
end
