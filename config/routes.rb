Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]

  root 'pages#home'

  get  '/help',    to: 'pages#help'
  get  '/about',   to: 'pages#about'
end
