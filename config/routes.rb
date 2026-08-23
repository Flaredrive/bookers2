Rails.application.routes.draw do
  root "homes#top"
  get "home/about", to: "homes#about"
  get "homes/forgot", to: "homes#forgot"
  #get 'users/sign_up' => 'users#new', as: 'sign_up'
  resources :users, only: [:new, :create, :index, :show, :edit, :update], path_names: { new: 'sign_up' }
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resource :session
  resources :passwords, param: :token
  get "up" => "rails/health#show", as: :rails_health_check
end