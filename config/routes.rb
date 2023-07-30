Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "parking_slots#index"
  resources :parking_slots do
    collection do
      post 'park_car'
      delete 'remove_car'
    end
  end
  resources :cars
  resources :tickets, only: [:index]
  get 'cars/ticket_numbers_of_particular_color', to: 'cars#ticket_numbers_of_particular_color'
end
