require 'rails_helper'

RSpec.describe "admin/departments/new", type: :view do
  before(:each) do
    assign(:admin_department, Admin::Department.new())
  end

  it "renders new admin_department form" do
    render

    assert_select "form[action=?][method=?]", admin_departments_path, "post" do
    end
  end
end
