Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :events
  resources :event_attendees, only: %i[create destroy]
  get 'events/index'
  root 'home#index'
end
