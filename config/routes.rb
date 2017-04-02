Rails.application.routes.draw do
  get 'questions/index'

  get 'user_pairs/new'

  devise_for :users
  resources :users, only: [:index, :show]
  resources :surveys do
    resources :survey_questions
  end

  root 'pages#home'

  get  '/help',    to: 'pages#help'
  get  '/about',   to: 'pages#about'

  patch '/surveys/:id/edit',  to: 'surveys#update'
  get '/surveys/:id',  to: 'surveys#show'
end
