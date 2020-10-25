module Admin::User
  class PasswordsController < Devise::PasswordsController
    layout 'admin_sign_in'
  end
end
