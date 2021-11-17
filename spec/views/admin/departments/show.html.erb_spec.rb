require 'rails_helper'

RSpec.describe "admin/departments/show", type: :view do
  before(:each) do
    @admin_department = assign(:admin_department, Admin::Department.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
