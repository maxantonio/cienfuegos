Rails.application.routes.draw do
  resources :posts

  resources :users, controller: 'users', only: Clearance.configuration.user_actions

  resources :admin
end
