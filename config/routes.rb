Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # rootは'/'を指す。以下はget '/' => "home#index"と同義
  # root to: "home#index"
  get 'up' => 'rails/health#show', as: :rails_health_check
  get '/about' => 'home#about'

  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'articles#index'

  # resources :articles
  resources :articles
end
