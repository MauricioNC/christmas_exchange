Rails.application.routes.draw do
  resources :groups
  root 'home#index'
end
