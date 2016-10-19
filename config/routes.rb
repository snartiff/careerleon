Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "users#index"

  resources :users

  resources :goals do
    resources :steps

  end
end
