Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }


  root to: 'boats#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  resources :boats do
    resources :bookings, only: [ :create ]
  end

  get "booking/:id/accept", to: "bookings#accept", as: "accept_booking"
  get "booking/:id/decline", to: "bookings#decline", as: "decline_booking"

  get "/contact",          to: "pages#contact"
  get "/le_projet",          to: "pages#le_projet"
  get "/l_association",          to: "pages#l_association"
end
