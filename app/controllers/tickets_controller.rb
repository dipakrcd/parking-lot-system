class TicketsController < ApplicationController
    def index
      params = params[:registration_number]
      if params[:registration_number]
        car = Car.find_by(params[:registration_number])
        @ticket = Ticket.where(car_id: car.id,is_car_parked: true)
        render json: @ticket
      else
        render json: { message: "car not parked" }
      end
    end
end
