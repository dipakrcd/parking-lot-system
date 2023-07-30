class AddReferencesToParkingSlot < ActiveRecord::Migration[7.0]
  def change
    add_reference :parking_slots, :ticket
  end
end
