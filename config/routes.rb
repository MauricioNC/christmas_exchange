Rails.application.routes.draw do
  resources :groups, :participants

  root 'home#index'

  get '/group/:group_name/:token', to: 'participants#new'
  get '/participant/:participant_name/:token', to: 'exchange#index'
end
