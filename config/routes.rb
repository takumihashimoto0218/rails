Rails.application.routes.draw do
  devise_for :users
  resources :boards do
    resource :favorites, only: [:create, :destroy]
  end
  resources :tasks
  resource :profile, only: [:new, :create,:show, :edit, :update]
  resources :packs
  resources :packdetails
end
