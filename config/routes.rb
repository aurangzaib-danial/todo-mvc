Rails.application.routes.draw do

  root 'lists#index'
  
  resources :lists, only: [:index, :create, :show] do
    resources :tasks, only: [:create]
  end
end
