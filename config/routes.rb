Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  namespace :api do
    resources :trips do
      resources :trip_checklists do
        resources :checklist_items, only: [:index, :create, :update, :destroy] do
          member do
            put :check, to: 'checklist_items#toggle_checked'
          end
        end
    end
    end

    get '/categories', to: 'categories#index'

    namespace :admin do
      resources :categories, only: [:index, :create, :update, :destroy]
    end
  end

  get '/profile', to: 'profile#show'
end
