require 'rails_helper'

RSpec.describe "admin/departments/edit", type: :view do
  before(:each) do
    @admin_department = assign(:admin_department, Admin::Department.create!())
  end

  it "renders the edit admin_department form" do
    render

    assert_select "form[action=?][method=?]", admin_department_path(@admin_department), "post" do
    end
  end
end
