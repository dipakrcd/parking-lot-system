class Car < ApplicationRecord
    has_one :parking_slot
    has_one :ticket
end
