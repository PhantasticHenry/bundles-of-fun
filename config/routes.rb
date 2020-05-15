Rails.application.routes.draw do
  
  resources :po_products
  resources :products
  resources :purchase_orders do 
    resources :products
  end
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  get 'logout', to: 'sessions#destroy'

  root 'static_pages#home'
end
