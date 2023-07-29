class ParkingSlot < ApplicationRecord
  belongs_to :ticket, optional: true
end
