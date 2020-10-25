Rails.application.routes.draw do
  # devise_for :users

  namespace :admin do
    devise_for :users, path: '', controllers: { sessions: 'admin/user/sessions', passwords: 'admin/user/passwords' }

    root 'users#index'

    resources :users
    resources :departaments
  end

  namespace :app do
    # soon..
  end
end
