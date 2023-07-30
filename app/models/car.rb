class Car < ApplicationRecord
    has_many :ticket
    validates :registration_number, :color, presence: true
    validates :registration_number, uniqueness: true
end
