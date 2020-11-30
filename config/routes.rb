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

  scope module: 'pwa', path: 'app' do
    devise_for :users, path: '', controllers: { sessions: 'pwa/auth/sessions', passwords: 'pwa/auth/passwords' }

    root 'field_forms#index'

    resources :field_forms, except: %i[delete]
  end
end
