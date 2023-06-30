Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"

  get '/pages/components', to: 'pages#components'

  resources :events do
    resources :participants, only: [:create, :destroy]
    resource :chatroom, only: :show do
      resources :messages, only: :create
    end
  end

  resources :sports

  get '/events/search', to: 'events#search', as: 'event_search'

end
