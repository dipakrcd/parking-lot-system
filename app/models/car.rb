class Car < ApplicationRecord
    has_one :parking_slot
    has_one :ticket
    validates :registration_number, :color, presence: true
    validates :registration_number, uniqueness: true
end
