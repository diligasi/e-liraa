Rails.application.routes.draw do
  root 'home#handler'

  namespace :admin do
    devise_for :users, path: '', controllers: { sessions: 'admin/auth/sessions', passwords: 'admin/auth/passwords' }

    root to: redirect('/')

    resources :faqs
    resources :users
    resources :shed_types
    resources :departaments
    resources :larva_species
    resources :property_types
    resources :institutionals

    resources :larvas,      only: %i[create update]

    resources :field_forms, only: %i[index show edit update] do
      collection do
        resources :search_filters, only: %i[index], controller: 'field_forms/search_filters', as: 'field_form_search_filters'
      end
    end
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
