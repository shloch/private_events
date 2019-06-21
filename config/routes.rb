Rails.application.routes.draw do
  get 'events/index'
  get 'events/new'
  get 'events/create'
  root 'staticpages#home'

  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
