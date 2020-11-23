Rails.application.routes.draw do
  # devise_for :users

  namespace :admin do
    devise_for :users, path: '', controllers: { sessions: 'admin/auth/sessions', passwords: 'admin/auth/passwords' }

    root 'users#index'

    resources :faqs
    resources :users
    resources :shed_types
    resources :departaments
    resources :larva_species
    resources :property_types

    resources :larvas,      only: %i[create update]
    resources :field_forms, only: %i[index show edit update]
  end

  namespace :app do
    # soon..
  end
end
