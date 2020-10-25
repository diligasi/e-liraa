require "rails_helper"

RSpec.describe Admin::DepartamentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/departaments").to route_to("admin/departaments#index")
    end

    it "routes to #new" do
      expect(get: "/admin/departaments/new").to route_to("admin/departaments#new")
    end

    it "routes to #show" do
      expect(get: "/admin/departaments/1").to route_to("admin/departaments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/admin/departaments/1/edit").to route_to("admin/departaments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/admin/departaments").to route_to("admin/departaments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/admin/departaments/1").to route_to("admin/departaments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/admin/departaments/1").to route_to("admin/departaments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/departaments/1").to route_to("admin/departaments#destroy", id: "1")
    end
  end
end
