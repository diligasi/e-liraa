require 'rails_helper'

RSpec.describe "admin/users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        name: "Name",
        cpf: "Cpf",
        email: "Email",
        status: false,
        role: 2
      ),
      User.create!(
        name: "Name",
        cpf: "Cpf",
        email: "Email",
        status: false,
        role: 2
      )
    ])
  end

  it "renders a list of admin/users" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Cpf".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
