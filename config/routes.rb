Rails.application.routes.draw do

  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
  resources :events

  get "creator/:id", to: "users#show", as: :created_events
  get "attended_events.html.erb/:id", to: "users#attended_events.html.erb", as: :attended_events
end
