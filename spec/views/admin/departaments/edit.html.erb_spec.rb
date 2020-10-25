require 'rails_helper'

RSpec.describe "admin/departaments/edit", type: :view do
  before(:each) do
    @admin_departament = assign(:admin_departament, Admin::Departament.create!())
  end

  it "renders the edit admin_departament form" do
    render

    assert_select "form[action=?][method=?]", admin_departament_path(@admin_departament), "post" do
    end
  end
end
