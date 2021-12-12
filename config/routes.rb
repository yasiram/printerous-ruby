Rails.application.routes.draw do
  root "organization#index"
  #get 'organization/index'
  resources :organization
  resources :people
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :user
end
