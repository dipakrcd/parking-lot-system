require 'rails_helper'

RSpec.describe ParkingSlotsController, type: :controller do
    describe "POST , /park_car" do
      let(:car)  { FactoryBot.create(:car) }
      let(:car_registration_number) { 'AB123' }
      let(:parking_slot) { FactoryBot.create(:parking_slot) }
      let(:parking_slot_id) { parking_slot.id } 

      before do
        allow(controller).to receive(:find_nearest_distance).and_return(parking_slot_id)
      end

      context "when car not found " do
        it "should return car not_found error" do
          post :park_car, params: {registration_number: "123456"}
          expect(flash[:alert]).to eq("Car not found")
        end
      end

      context "when car is found and parking slot also available" do
        it "should park the car" do
            post :park_car, params: {registration_number: car.registration_number}
            expect(flash[:notice]).to eq("Car Parked at slot number #{parking_slot.id}")
         end 
      end

      describe "when is car is found but parking_slot unavilable" do
        before do
            allow(controller).to receive(:find_nearest_distance).and_return(nil)
        end

        it "should not park the car" do
            post :park_car, params: {registration_number: car.registration_number}
            expect(flash[:alert]).to eq("No space avaibale to park car")
         end
      end
    end

    describe "DELETE, /remove_car" do
        let!(:car)  { FactoryBot.create(:car) }
        let!(:ticket) { Ticket.create(car_id: car.id) }
        let!(:parking_slot) { FactoryBot.create(:parking_slot,ticket_id: ticket.id,is_empty: true) }
    
      context "when car is parked" do    
        
        it "should remove car from paeking slot" do
           delete :remove_car, params: { registration_number: car.registration_number }
          expect(flash[:notice]).to eq("Car removed from parking slot")
        end
      end
      
      context "when car is not parked" do
        let!(:ticket) { Ticket.create(car_id: car.id, is_car_parked: false) }
        it "should give car not parked message" do
          delete :remove_car, params: { registration_number: car.registration_number }
          expect(flash[:notice]).to eq("Car with Registration_number not parked")
        end
      end
    end
end