Rails.application.routes.draw do
  resources :posts

  root 'static_pages#home'
  get 'home', to: 'static_pages#home'
  get 'photos/index'
  post 'photos/upload'
  get 'search', to: 'search#search'
end
