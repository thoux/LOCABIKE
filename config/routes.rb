Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :bike_ads do
    member do
      resources :bookings, only: [:new, :create]
    end
  end

  resources :users, only: [:index, :show]
  get 'users/:id/my_profil', to: 'users#my_profil', as: :user_profil
  delete 'bookings/:id', to: 'bookings#destroy', as: :destroy_booking
  patch 'bookings/:id', to: 'bookings#approve', as: :approve_booking

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
