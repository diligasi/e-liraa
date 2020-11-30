module Pwa::Auth
  class SessionsController < Devise::SessionsController
    layout 'pwa_sign_in'
  end
end
