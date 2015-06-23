Rails.application.routes.draw do
  get "/login" => "user_sessions#new", as: :login
  delete "/logout" => "user_sessions#destroy", as: :logout

  get 'imprint', to: 'pages#imprint', as: 'imprint'

  resources :users do
    member { get :confirm_email }
  end
  
  resources :user_sessions, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  resources :hackathons do
    collection do
      post :import
      get :upload
    end
    member do
      post :follow
      post :unfollow
    end
  end
  root to: 'hackathons#index'
end
