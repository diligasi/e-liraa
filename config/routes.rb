Rails.application.routes.draw do
  # devise_for :users

  namespace :admin do
    devise_for :users, path: '', controllers: { sessions: 'admin/auth/sessions', passwords: 'admin/auth/passwords' }

    root 'users#index'

    resources :users
    resources :departaments
    resources :property_types
  end

  namespace :app do
    # soon..
  end
end
