FactoryBot.define do
    factory :parking_slot do
      is_empty { false }
      x_coordinate { 0 }
      y_coordinate { 0 }
      distance_from_entry_point { 1 }
    end
  end