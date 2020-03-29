Rails.application.routes.draw do

  root 'site#index'
  
  get 'signup', to: 'users#new'

  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  resources :lists, only: [:create, :show] do
    resources :tasks, only: [:create, :update, :destroy]
  end
end
