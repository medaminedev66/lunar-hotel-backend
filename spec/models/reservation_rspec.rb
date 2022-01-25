require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.create(name: 'Amine', email: 'example@mail.com', password: 'password') }
  let(:room) { Room.create(user_id: user.id, name: 'See view', picture: 'pic.png', city: 'Rabat', rate: 4, room_type: "Master", amenities:  'swimming pool') }
  let(:reservation){ Reservation.create(nights: '5', check_in: '2022-02-1', check_out: '2022-02-6', room_id: room.id, user_id: user.id)}

  describe 'Validations' do
    context 'when valid' do
      it { expect(reservation).to be_valid }
    end
    
  end
end