Rails.application.routes.draw do
  
  resources :materials
  root 'static_pages#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  get 'logout', to: 'sessions#destroy'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :po_products
  resources :product_materials
  resources :users
  
  resources :purchase_orders do 
    resources :po_products
  end
  
  resources :products do 
    resources :product_materials
  end
  


end
