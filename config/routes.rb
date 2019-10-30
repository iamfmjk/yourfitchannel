Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'static#index'
  resources :workouts
  resources :users, only: :show do
    resources :playlists
    resources :videos
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
