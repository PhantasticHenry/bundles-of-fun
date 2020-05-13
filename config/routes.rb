Rails.application.routes.draw do
  
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'signup', to: 'users#new'
  

  root 'static_pages#home'
end
