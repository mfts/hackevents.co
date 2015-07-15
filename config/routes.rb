Rails.application.routes.draw do
  get "/login" => "user_sessions#new", as: :login
  delete "/logout" => "user_sessions#destroy", as: :logout

  get 'imprint', to: 'pages#imprint', as: 'imprint'
  get 'hackathon/:country/:city/:name', to: 'hackathons#show', as: :hackathon_by_id
  get 'hackathon/:country', to: 'hackathons#index', as: :hackathons_by_country
  get 'hackathon/:country/:city', to: 'hackathons#index', as: :hackathons_by_city
  
  get 'hackathons/display', to: 'hackathons#display'

  resources :users do
    member { get :confirm_email }
  end
  
  resource :profile
  
  resources :user_sessions, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  resources :hackathons do
    collection do
      post :import
      get :export
      get :upload
    end
    member do
      post :follow
      post :unfollow
    end
  end
  root to: 'hackathons#index'
end
