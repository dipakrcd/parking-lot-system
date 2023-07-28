class Ticket < ApplicationRecord
    belongs_to :car, optional: true
end
