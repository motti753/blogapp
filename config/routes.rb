require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  devise_for :models
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # development環境の場合、'/sidekiq'にアクセスするとジョブとキューの中身が確認きる
  mount Sidekiq::Web => "/sidekiq" if Rails.env.development?


  # development環境の場合、'/letter_opener'にアクセスするとLetterOpenerWebの内容が確認きる
  mount LetterOpenerWeb::Engine, at:'/letter_opener' if Rails.env.development?
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # rootは'/'を指す。以下はget '/' => "home#index"と同義
  # root to: "home#index"
  get 'up' => 'rails/health#show', as: :rails_health_check
  get '/about' => 'home#about'

  # application.html.hamlで"turbo_method: :destroy"を指定していてもnomethodErrorが出るため。
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Defines the root path route ("/")
  # root "posts#index"
  root to: 'articles#index'

  # resources :articles
  resources :articles
    # resources :articlesの中に「resources :comments」でURL「articles/id/new」となる

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  namespace :api, defaults: {format: :json} do
    scope '/articles/:article_id' do
      resources :comments, only: [:index, :create]
      resource :like, only: [:show, :create, :destroy]
    end
  end

  scope module: :apps do
    resources :favorites, only: [:index]
    resource :profile, only: [:show, :edit, :update]
    resource :timeline, only: [:show]
  end
end
