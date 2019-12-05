require 'rails_helper'

describe RentalBuilder do
  describe '.builder' do
    it 'should build a rental stance' do
      subsidiary = create(:subsidiary)
      client = create(:client)
      category = create(:category, name: 'A', daily_rate: 50.0, car_insurance: 60.0,
                           third_party_insurance: 20)
      car_model = create(:car_model, name: 'SUV', category: category)
      create(:car, car_model: car_model, category: category, subsidiary: subsidiary)
      params = build(:rental, client: client, category: category).attributes

      allow(TokenGenerator).to receive(:generate).and_return 'ABC123'
      result = RentalBuilder.new(params, subsidiary).build
      expect(result).to be_valid
      expect(result).to be_scheduled
      expect(result.subsidiary).to eq subsidiary
      expect(result.reservation_code).to eq 'ABC123'
    end

    it 'should build a rental stance' do
      subsidiary = create(:subsidiary)
      client = create(:client)
      category = create(:category, name: 'A', daily_rate: 50.0, car_insurance: 60.0,
                           third_party_insurance: 20)
      car_model = create(:car_model, name: 'SUV', category: category)
      create(:car, car_model: car_model, category: category, subsidiary: subsidiary)
      params = build(:rental, client: client, category: category).attributes

      allow(StaticGenerator).to receive(:generate).and_return 'ABC123'
      result = RentalBuilder.new(params, subsidiary, StaticGenerator).build
      expect(result).to be_valid
      expect(result).to be_scheduled
      expect(result.subsidiary).to eq subsidiary
      expect(result.reservation_code).to eq 'ABC123'
    end
  end
end
