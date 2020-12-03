module Admin::Auth
  class SessionsController < Devise::SessionsController
    layout 'admin_sign_in'

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || admin_root_path
    end

    def after_sign_out_path_for(_)
      new_admin_user_session_path
    end
  end
end
