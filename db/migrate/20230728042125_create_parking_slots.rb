class CreateParkingSlots < ActiveRecord::Migration[7.0]
  def change
    create_table : parking_slots do |t|
      t.boolean : is_empty, default: false
      t.integer : x_coordinate
      t.integer : y_coordinate
      t.float : distance_from_entry_point
      t.references :car, foreign_key: true
      t.timestamps
    end
  end
end
