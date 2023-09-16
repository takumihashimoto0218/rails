Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :admin do
    resources :users, only: [:index, :show]
  end
  
  resources :boards do
    member do
      patch :update_task_order
    end
    post 'favorite', to: 'favorites#create'
    delete 'favorite', to: 'favorites#destroy'
  end
  resources :tasks
  resource :profile, only: [:new, :create,:show, :edit, :update]
  resources :packs
  resources :packdetails
end
