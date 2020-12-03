module Pwa::Auth
  class SessionsController < Devise::SessionsController
    layout 'pwa_sign_in'

    def after_sign_in_path_for(resource)
      stored_location_for(resource) || app_root_path
    end

    def after_sign_out_path_for(_)
      new_user_session_path
    end
  end
end
