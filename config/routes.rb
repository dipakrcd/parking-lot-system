Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "parking_slots#index"
  resources :parking_slots do
    post 'park_car', on: :collection
  end
  post 'parking/park_car', to: 'parking#park_car'
  get 'cars/registration_numbers_by_color', to: 'cars#registration_numbers_by_color'
  get 'cars/ticket_numbers_of_particular_color', to: 'cars#ticket_numbers_of_particular_color'
end
