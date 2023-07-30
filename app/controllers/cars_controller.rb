class CarsController < ApplicationController
  def index
    if params[:color].present?
      @cars = Car.where(color: params[:color])
      if @cars.empty?
        flash[:notice] = "No cars found with the color '#{params[:color]}'."
        redirect_to cars_path  
      end
    end
  end

  def new 
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to parking_slots_path
    else
      render :new, status: :unprocessable_entity
    end
  end
 

  def ticket_numbers_of_particular_color
    color = params[:color]
    cars = Car.where(color: color)
    if cars.present?
      ticket_numbers = Ticket.joins(:car).where(cars: {color: color}).pluck(:id)
      render json: { ticket_numbers: ticket_numbers }
    else
      render json: { message: "no cars available with #{color} color" }
    end
  end 

  private

  def car_params
    params.require(:car).permit(:registration_number, :color)
  end

end
