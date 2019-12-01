Rails.application.routes.draw do
  resources :port_images
  resources :itineraries
  resources :voyage_ports
  resources :voyages
  resources :ports
  resources :regions
  resources :helpfuls
  resources :comments
  resources :reviews
  resources :ship_images
  resources :ships
  resources :cruise_lines
  resources :user_profiles
  resources :thing_with_images
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
end
