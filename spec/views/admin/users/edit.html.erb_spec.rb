require 'rails_helper'

RSpec.describe "admin/users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      name: "MyString",
      cpf: "MyString",
      email: "MyString",
      status: false,
      role: 1
    ))
  end

  it "renders the edit admin_user form" do
    render

    assert_select "form[action=?][method=?]", admin_user_path(@adminuser), "post" do

      assert_select "input[name=?]", "admin_user[name]"

      assert_select "input[name=?]", "admin_user[cpf]"

      assert_select "input[name=?]", "admin_user[email]"

      assert_select "input[name=?]", "admin_user[status]"

      assert_select "input[name=?]", "admin_user[role]"
    end
  end
end
