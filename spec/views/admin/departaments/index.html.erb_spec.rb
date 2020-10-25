require 'rails_helper'

RSpec.describe "admin/departaments/index", type: :view do
  before(:each) do
    assign(:admin_departaments, [
      Admin::Departament.create!(),
      Admin::Departament.create!()
    ])
  end

  it "renders a list of admin/departaments" do
    render
  end
end
