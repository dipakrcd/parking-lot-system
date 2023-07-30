class TicketsController < ApplicationController
    def index
      registration_number = params[:registration_number]
      car = Car.find_by(registration_number: params[:registration_number])
      if car.present?
        @ticket = Ticket.where(car_id: car.id,is_car_parked: true)
        render json: @ticket
      else
        render json: { message: "car not parked" }
      end
    end
end
