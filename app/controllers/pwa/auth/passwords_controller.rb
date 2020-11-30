module Pwa::Auth
  class PasswordsController < Devise::PasswordsController
    layout 'pwa_sign_in'
  end
end
