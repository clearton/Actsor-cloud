Rails.application.routes.draw do
  resources :thresholds
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/contact', to: 'home#contact'

  resources :actuators do
    collection do
      post :change_status
      get :threshold_list
    end
  end
  resources :sensors do
    member do
      get :payload
      get :plot
    end
  end
  resources :balls do
    member do
      get :all_plots
    end
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
