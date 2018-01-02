Rails.application.routes.draw do
  devise_for :admins, controllers: { registrations: "registrations"}

  resources :posts do
  resources :comments, only: [:index, :create, :destroy]
end

  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  get 'portfolio', to: 'static_pages#portfolio'
  get 'about', to: 'static_pages#about'

  get 'photos/index'
  post 'photos/upload'
  get 'search', to: 'search#search'
end
