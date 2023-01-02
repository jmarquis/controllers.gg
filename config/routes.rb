Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'authentication/confirmations',
    passwords: 'authentication/passwords',
    registrations: 'authentication/registrations',
    sessions: 'authentication/sessions',
  }

  root 'application#index'

  get '/ping', to: 'application#ping'

  get '/about', to: 'application#about'
  get '/terms', to: 'application#terms'

  get '/profile', to: 'profiles#show', as: :user_root
  resource :profile, only: [:edit, :update, :create]
  post '/profile/photo', to: 'profiles#upload_photo'
  post '/profile/photo-order', to: 'profiles#reorder_photos'
  post '/profile/remove-photo/:uuid', to: 'profiles#remove_photo'

  resources :modders, only: [:index, :show]

end
