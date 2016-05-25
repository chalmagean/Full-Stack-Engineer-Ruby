Rails.application.routes.draw do
  root 'comics#index'
  resources :votes
end
