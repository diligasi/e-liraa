module Admin::Auth
  class PasswordsController < Devise::PasswordsController
    layout 'admin_sign_in'
  end
end
