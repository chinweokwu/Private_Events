Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :events
  resources :event_attendees, only: %i[create destroy]
  resources :users, only: %i[index]
  get 'users/index'
  get 'events/index'
  get 'home/index'
  root 'home#index'
end
