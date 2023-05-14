Rails.application.routes.draw do
  devise_for :users
  resources :boards
  resources :tasks
  resource :profile, only: [:new, :create,:show, :edit, :update]
end
