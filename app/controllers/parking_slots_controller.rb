class ParkingSlotsController < ApplicationController

  def index 
    @parking_slots = ParkingSlot.all
  end

  def park_car
    car_registration_number = params[:registration_number]
    car = Car.find_by(registration_number: car_registration_number)
    parking_slot_id = find_nearest_distance

    if car.nil?
      flash[:alert] = "Car not found"
      redirect_to root_path
    else
          
      if !is_parked?(car)
        if parking_slot_id
          ticket = Ticket.create(car_id: car.id)
          parking_slot = ParkingSlot.find(parking_slot_id)
          car_parked_at_parking_slot = parking_slot.update(is_empty: true,ticket_id: ticket.id)
          flash[:notice] = "Car Parked"
          redirect_to parking_slots_path
        else
          flash[:alert] = "No space avaibale to park car"
          redirect_to parking_slots_path
        end
      else
        flash[:alert] = "Car is already parked"
        redirect_to parking_slots_path
      end
    end
  end

  def find_nearest_distance
    parking_slot = ParkingSlot.where(is_empty:false).order(:distance_from_entry_point).first
    if parking_slot
      return parking_slot.id
    else 
      return nil
    end
  end 

  def remove_car
    car_registration_number = params[:registration_number]
    car = Car.find_by(registration_number: car_registration_number)
    ticket = car.ticket.where(is_car_parked: true).first
    
    if car.present? && ticket.present?
      ticket.update(is_car_parked: false)
      ticket.parking_slot.update(is_empty: false,ticket_id: nil)
      flash[:notice] = "Car removed from parking slot"
      redirect_to parking_slots_path
    else
      flash[:notice] = "Car with Registration_number not parked"
      redirect_to parking_slots_path
    end
  end

  def is_parked?(car)
    ticket = Ticket.where(car_id: car.id,is_car_parked: true)
    
    if ticket.present?
      return true
    else
      return false
    end
  end

end
