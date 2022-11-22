Rails.application.routes.draw do
  get 'users/new'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  devise_for :users
  #get 'homes/top'
  #get 'homes/about'
  root to: 'homes#top'
  get 'homes/about'
  resources :books
  resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
