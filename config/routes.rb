Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
  resources :events
  get 'events/index'
  root 'home#index'
end
