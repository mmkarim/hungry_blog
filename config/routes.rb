Rails.application.routes.draw do
  resources :posts

  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  get 'portfolio', to: 'static_pages#portfolio'
  get 'about', to: 'static_pages#about'

  get 'photos/index'
  post 'photos/upload'
  get 'search', to: 'search#search'
end
