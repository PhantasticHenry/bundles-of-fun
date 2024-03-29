Rails.application.routes.draw do
  
  root 'static_pages#home'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  get 'logout', to: 'sessions#destroy'
  get 'bag', to: 'products#bag'
  get 'harness', to: 'products#harness'
  get '/auth/facebook/callback', to: 'sessions#omni'
  get '/auth/google_oauth2/callback', to: 'sessions#omni'
  
  resources :users
  resources :po_products
  resources :product_materials
  resources :materials
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :purchase_orders do 
    resources :po_products
  end
  
  resources :products do 
    resources :product_materials
  end
  


end
