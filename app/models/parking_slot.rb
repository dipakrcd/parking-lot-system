class ParkingSlot < ApplicationRecord
    belongs_to :car, optional: true
end
