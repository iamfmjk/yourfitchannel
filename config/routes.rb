Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'static#index'

  resources :users do
    resources :videos do
      resources :workouts, only: [:new, :create]
    end
    resources :workouts
  end

  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
