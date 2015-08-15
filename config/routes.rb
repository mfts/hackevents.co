Rails.application.routes.draw do
  #get "/login" => "user_sessions#new", as: :login_email
  delete "/logout" => "twitter_accounts#destroy", as: :logout

  get 'imprint', to: 'pages#imprint', as: 'imprint'
  get 'about', to: 'pages#aboutpage', as: 'about'
  get 'hackathon/:country/:city/:name', to: 'hackathons#show', as: :hackathon_by_id
  get 'hackathon/:country', to: 'hackathons#index', as: :hackathons_by_country
  get 'hackathon/:country/:city', to: 'hackathons#index', as: :hackathons_by_city
  
  get '@:username', to: 'users#show', as: :user
  
  post 'show_sidebar', to: 'hackathons#show_sidebar', as: :show_sidebar
  post 'hide_sidebar', to: 'hackathons#hide_sidebar', as: :hide_sidebar
  
  resources :users do
    member do
      get :confirm_email
      get :following, :followers, :hackathons
    end
  end
  
  resource :profile do
    member do
      get :email, :interest, :affiliation, :location, :resend_email_confirmation
      patch :email, :interest, :affiliation, :location
      post :email, :interest, :affiliation, :location
    end
  end

  #get "/login" => "profiles#login", as: :login
  get "/profile/settings" => "profiles#edit", as: :settings_profile
  
  #resources :user_sessions, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :relationships, only: [:create, :destroy]
  
  resources :hackathons do
    member do
      post :follow
      post :unfollow
    end
  end
  root to: 'hackathons#index'
  
  namespace :admin do
    root to: 'welcome#index'
    resources :categories
    resources :users
    resources :sponsors
    resources :hackathons do
      collection do
        post :import
        get :export
        get :upload
      end
    end
  end
  
  resources :twitter_accounts
  # Twitter routes
  get '/auth/twitter/callback', to: 'twitter_accounts#create', as: 'callback'
  get '/auth/failure', to: 'twitter_accounts#error', as: 'failure'
  #delete '/signout', to: 'twitter_accounts#destroy', as: 'signout'


end
