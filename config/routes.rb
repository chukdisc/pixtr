Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root to: "galleries#index"

  resources :galleries, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :images, only: [:new, :create, :edit, :update]
  end
  resources :groups, only: [:new, :create, :index] do
    resource :group_membership, only: [:create, :destroy]
  end
  resources :images, only: [:show, :edit, :update] do
    resources :comments, only: [:create]
    resource :like, only: [:create, :destroy]
  end
end
