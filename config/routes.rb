Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'boats#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :boats do
    resources :bookings, only: [ :create ]
  end

  get "booking/:id/accept", to: "bookings#accept", as: "accept_booking"
  get "booking/:id/decline", to: "bookings#decline", as: "decline_booking"
end
