Rails.application.routes.draw do
  root "homes#top"
  get "homes/about", to: "homes#about"
  get "homes/forgot", to: "homes#forgot"
  resources :users, only: [:new, :create, :index, :show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resource :session
  resources :passwords, param: :token
  get "up" => "rails/health#show", as: :rails_health_check
end