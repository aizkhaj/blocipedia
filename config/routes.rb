Rails.application.routes.draw do
  root 'welcome#index'

  resources :wikis
  resources :charges, only: [:new, :create]
  post 'charges/downgrade_to_basic', as: 'downgrade'

  devise_for :users
end
