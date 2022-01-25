require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.create(name: 'Amine', email: 'example@mail.com', password: 'password') }
  let(:room) { Room.create(user_id: user.id, name: 'See view', picture: 'pic.png', city: 'Rabat', rate: 4, room_type: "Master", amenities:  'swimming pool') }
  let(:reservation){ Reservation.create(nights: '5', check_in: '2022-02-1', check_out: '2022-02-6', room_id: room.id, user_id: user.id)}

  describe 'Validations' do
    context 'when valid' do
      it { expect(reservation).to be_valid }
    end

    it 'should allow valid nights' do
      reservation.nights = nil
      expect(reservation).to_not be_valid
    end

    it 'should allow valid nights' do
      reservation.nights = 7
      expect(reservation).to be_valid
    end

    it 'should allow valid nights' do
      reservation.nights = 0
      expect(reservation).to be_valid
    end

    it 'should allow valid check in' do
      reservation.check_in = nil
      expect(reservation).to_not be_valid
    end

    it 'should allow valid check in' do
      reservation.check_in = '2022-10-1'
      expect(reservation).to be_valid
    end

    it 'should allow valid check out' do
      reservation.check_out = nil
      expect(reservation).to_not be_valid
    end

    it 'should allow valid check 0ut' do
      reservation.check_out = '2022-10-15'
      expect(reservation).to be_valid
    end
  end
end