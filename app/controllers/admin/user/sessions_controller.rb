module Admin::User
  class SessionsController < Devise::SessionsController
    layout 'admin_sign_in'
  end
end
