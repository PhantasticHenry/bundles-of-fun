Rails.application.routes.draw do
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  root 'static_pages#home'
end
