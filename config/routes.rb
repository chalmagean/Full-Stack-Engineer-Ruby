Rails.application.routes.draw do
  root 'comics#index'
  resources :votes
  resources :comics, only: [:index]
end
