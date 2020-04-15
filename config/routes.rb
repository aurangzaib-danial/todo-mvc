Rails.application.routes.draw do

  root 'site#index'

  devise_for :users, skip: :registrations, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}

  devise_scope :user do
    scope :users, module: :devise do
      controller :registrations do
        get 'sign_up', action: 'new', as: :new_user_registration
        get 'cancel', action: 'cancel', as: :cancel_user_registration
        post '/', action: 'create', as: :user_registration
      end
    end
  end

  resources :lists, only: [:create, :show, :destroy] do
    get 'sharing', on: :member
    resources :tasks, only: [:create, :update, :destroy]
    resources :collaborator_lists, only: [:create, :destroy]
  end

  get 'shared', to: 'lists#shared'
end
