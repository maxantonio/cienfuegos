Rails.application.routes.draw do
  resources :users, controller: 'users', only: Clearance.configuration.user_actions
end
