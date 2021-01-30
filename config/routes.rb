Rails.application.routes.draw do
  devise_for :users
  root to: 'bike_ads#index'
  resources :bike_ads
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
