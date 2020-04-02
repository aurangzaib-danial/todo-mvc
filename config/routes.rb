Rails.application.routes.draw do

  root 'site#index'

  devise_for :users, skip: [:registrations, :sessions]

  devise_scope :user do
    scope :users, module: :devise do
      controller :registrations do
        get 'sign_up', action: 'new', as: :new_user_registration
        get 'cancel', action: 'cancel', as: :cancel_user_registration
        post '/', action: 'create', as: :user_registration
      end
    end
  end
    
  # get 'signup', to: 'users#new'

  # post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  delete 'logout', to: 'sessions#destroy'

  resources :lists, only: [:create, :show, :destroy] do
    resources :tasks, only: [:create, :update, :destroy]
  end
end
