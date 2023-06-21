Rails.application.routes.draw do
  devise_for :users
  resources :boards do
    post 'favorite', to:'favorites#create'
    delete 'favorite', to: 'favorites#destroy'
  end
  resources :tasks
  resource :profile, only: [:new, :create,:show, :edit, :update]
  resources :packs
  resources :packdetails
end