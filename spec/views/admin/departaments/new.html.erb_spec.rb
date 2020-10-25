require 'rails_helper'

RSpec.describe "admin/departaments/new", type: :view do
  before(:each) do
    assign(:admin_departament, Admin::Departament.new())
  end

  it "renders new admin_departament form" do
    render

    assert_select "form[action=?][method=?]", admin_departaments_path, "post" do
    end
  end
end
