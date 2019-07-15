Rails.application.routes.draw do
  get 'static_pages/create'
  root   'static_pages#home'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'
  post   '/relationships/:id', to: 'relationships#create'
  resources :users, :stores, :books, :relationships, :searches
  resources :stores, only: [:create, :destroy]
end
