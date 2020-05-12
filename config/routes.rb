Rails.application.routes.draw do
  
  resources :users
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  root 'static_pages#home'
end
