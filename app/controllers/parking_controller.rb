class ParkingController < ApplicationController
    protect_from_forgery with: :null_session

    def park_car
      car_registration_number = params[:car][:registration_number]
      car_color = params[:car][:color]
      parking_slot_id = find_nearest_distance
      car = Car.new(car_params)
      if car.save
        if parking_slot_id
            parking_slot = ParkingSlot.find(parking_slot_id)
            car_parked_at_parking_slot = parking_slot.update(is_empty: true,car_id: car.id)
            render json: parking_slot
        else
            render json: { message: "no slot available for parking" }, status: :not_found 
        end
      else
           render json: { errors: car.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def find_nearest_distance
        parking_slot = ParkingSlot.where(is_empty:false).order(:distance_from_entry_point).limit(1)
        if parking_slot
          return parking_slot[0][:id]
        else 
          return nil
        end
    end 

    private 
    
    def car_params
      params.require(:car).permit(:registration_number,:color)
    end 

end
