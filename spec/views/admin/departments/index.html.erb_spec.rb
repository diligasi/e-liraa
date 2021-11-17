require 'rails_helper'

RSpec.describe "admin/departments/index", type: :view do
  before(:each) do
    assign(:admin_departments, [
      Admin::Department.create!(),
      Admin::Department.create!()
    ])
  end

  it "renders a list of admin/departments" do
    render
  end
end
