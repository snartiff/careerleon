Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "users#index"

  resources :users
  resources :inspirations, only: [:index]
  resources :goals do
    resources :steps

  end
end
