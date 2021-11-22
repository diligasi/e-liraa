require 'rails_helper'

RSpec.describe "/admin/dashboards", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/dashboard/index"
      expect(response).to have_http_status(:success)
    end
  end

end
