class ParkingSlot < ApplicationRecord
  belongs_to :ticket, optional: true
  
  TOTAL_SLOT = 30
  NUMBER_OF_SLOT_PER_ROW = 6

end
