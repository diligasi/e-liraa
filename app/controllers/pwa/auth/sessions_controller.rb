module Pwa::Auth
  class SessionsController < Devise::SessionsController
    layout 'pwa_sign_in'

    def after_sign_in_path_for(resource)
      set_user
      stored_location_for(resource) || app_root_path
    end

    def after_sign_out_path_for(_)
      clean_user
      new_user_session_path
    end

    private

    def set_user
      cookies[:user_id] = current_user.id
    end

    def clean_user
      cookies.delete(:user_id)
    end
  end
end
