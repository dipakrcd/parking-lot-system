class TicketsController < ApplicationController
    def index
      if params[:registration_number].present?
        car = Car.find_by(registration_number: params[:registration_number])
        if !car.present?
          flash[:notice] = "No tickets with the registartion_number '#{params[:registration_number]}'."
          redirect_to tickets_path  
        else
          @ticket = Ticket.where(car_id: car.id,is_car_parked: true)
        end
      end
    end
end
