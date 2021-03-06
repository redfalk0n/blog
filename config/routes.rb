Rails.application.routes.draw do
  get '/profile', to: 'profile#show'
  post '/profile', to: 'profile#edit'
  resources :posts, only: [:show]
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home_page#index'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
