require 'rails_helper'

RSpec.describe "admin/departaments/show", type: :view do
  before(:each) do
    @admin_departament = assign(:admin_departament, Admin::Departament.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
