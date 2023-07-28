# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

number_of_parking_slots = 30
number_of_slots_per_row = 6
n = number_of_parking_slots / number_of_slots_per_row
entry_at_x = 0
entry_at_y = 0

for i in 1..n do
    for j in 1..number_of_slots_per_row do
      ParkingSlot.create!(x_coordinate:i, y_coordinate:j, 
      distance_from_entry_point: Math.sqrt( (j - entry_at_x) ** 2 + (i - entry_at_y) ** 2 ) )
    end
end

