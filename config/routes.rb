Rails.application.routes.draw do
  get 'bookings/create'

  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'boats#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :boats do
    resources :bookings, only: [ :create ]
  end
end
