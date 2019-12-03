require 'rails_helper'

describe RentalPresenter do
  describe '#status' do
    it 'should render primary badge' do
      rental = build(:rental, status: :scheduled)

      result = RentalPresenter.new(rental).status

      expect(result).to eq('agendada')
    end
  end
end
