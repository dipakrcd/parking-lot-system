class Ticket < ApplicationRecord
    belongs_to :car, optional: true
    has_one :parking_slot
end
