Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"

  get '/pages/components', to: 'pages#components'
  get 'users/:id', to: 'users#show', as: 'user'

  resources :users
  resources :events do
    resources :participants, only: [:create, :destroy]
  end
end
