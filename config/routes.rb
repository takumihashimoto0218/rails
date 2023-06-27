Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :boards
  resources :tasks
  resource :profile, only: [:new, :create,:show, :edit, :update]
  resources :packs
  resources :packdetails
end
