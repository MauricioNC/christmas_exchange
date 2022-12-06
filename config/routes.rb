Rails.application.routes.draw do
  resources :groups, :participants

  root 'home#index'

  get '/group/:group_name/:token', to: 'participants#new'
  # get '/group/:participant_name/:token', to: 'exchange#index'
end
