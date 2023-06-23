Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  get '/pages/components', to: 'pages#components'
  get 'users/:id', to: 'users#show', as: 'user'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")




  resources :events
  resources :users
end
