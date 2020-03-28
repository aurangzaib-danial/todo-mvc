Rails.application.routes.draw do

  root 'lists#index'
  
  get 'signup', to: 'users#new'

  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  resources :lists, only: [:index, :create, :show] do
    resources :tasks, only: [:create, :update, :destroy]
  end
end
