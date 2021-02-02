Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :bike_ads do
    member do
      resources :bookings, only: [:new, :create, :delete]
    end
  end
  resources :users, only: [:index, :show, :my_profile]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
