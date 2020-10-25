require 'rails_helper'

RSpec.describe "admin/users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      name: "Name",
      cpf: "Cpf",
      email: "Email",
      status: false,
      role: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
  end
end
