Rails.application.routes.draw do

  resources :users, only: [:index, :edit, :show, :update] do
    member do
      get :profile
    end
  end

  resource :sessions, only: [:create] do 
    collection do
      get :logout,  to: 'sessions#destroy'
      post :logout, to: 'sessions#destroy'
    end
  end
  # resources :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'sessions#login'
end
