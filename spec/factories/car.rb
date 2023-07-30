
FactoryBot.define do
    factory :car do
      registration_number { Faker::Number.number(digits: 10) }
      color { Faker::Color.color_name }
    end
  end