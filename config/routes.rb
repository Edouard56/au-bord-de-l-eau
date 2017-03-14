Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'boats#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :boats do
    resources :bookings, only: [ :create ]
  end
end
