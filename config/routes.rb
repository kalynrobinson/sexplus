Rails.application.routes.draw do
  get 'user_pairs/new'

  devise_for :users
  resources :users, only: [:index, :show]
  resources :surveys

  root 'pages#home'

  get  '/help',    to: 'pages#help'
  get  '/about',   to: 'pages#about'
end
