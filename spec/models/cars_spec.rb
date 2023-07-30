require 'rails_helper'

RSpec.describe Car, type: :model do
  describe " validate" do
    
    it 'is invalid if registration_number is not given' do
      car = build(:car, registration_number: nil)
      expect(car).not_to be_valid
    end

    it 'is invalid if color is not given' do
      car = build(:car, color: nil)
      expect(car).not_to be_valid
    end
    
    it "registration_number must be unique" do
      car1 = create(:car)
      car2 = build(:car, registration_number: car1.registration_number)
      expect(car2).not_to be_valid
    end
  end
end