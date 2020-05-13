Rails.application.routes.draw do
  
  resources :purchase_orders
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  get 'logout', to: 'sessions#destroy'

  root 'static_pages#home'
end
