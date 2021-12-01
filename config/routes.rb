Rails.application.routes.draw do
  root 'home#handler'

  namespace :admin do
    require 'sidekiq/web'

    mount Sidekiq::Web => 'sidekiq'
    mount ActionCable.server => '/cable'

    devise_for :users, path: '', controllers: { sessions: 'admin/auth/sessions', passwords: 'admin/auth/passwords' }

    root to: redirect('/')

    resources :faqs
    resources :users
    resources :regions
    resources :shed_types
    resources :departments
    resources :larva_species
    resources :property_types
    resources :institutionals

    resources :larvas,      only: %i[create update]

    resources :field_forms, only: %i[index show edit update] do
      collection do
        resources :search_filters, only: %i[index], controller: 'field_forms/search_filters', as: 'field_form_search_filters'
      end
    end

    get 'dashboard'  => 'dashboard#index'
    get 'csv_export' => 'dashboard#export'

    get 'filter_dashboard_by_date_range' => 'dashboard#filter_dashboard_by_date_range'
    get 'filter_regions_by_department'   => 'users#filter_regions_by_department'
  end

  scope module: 'pwa', path: 'app' do
    devise_for :users, path: '', controllers: { sessions: 'pwa/auth/sessions', passwords: 'pwa/auth/passwords' }

    root 'field_forms#index', as: 'app_root'

    resources :faqs,           only: %i[index]
    resources :institutionals, only: %i[index]

    resources :users,       except: %i[index new create destroy]
    resources :field_forms, except: %i[delete]
  end
end
