require 'rails_helper'

RSpec.describe Room, type: :model do
  let(:user) { User.create(name: 'Amine', email: 'example@mail.com', password: 'password') }
  let(:room) { Room.create(user_id: user.id, name: 'See view', picture: 'pic.png', city: 'Rabat', rate: 4, room_type: "Master", amenities:  'swimming pool') }

  describe 'Validations' do
    context 'when valid' do
      it { expect(room).to be_valid }
    end
  end

  it 'should allow valid name' do
    room.name = nil
    expect(room).to_not be_valid
  end
end    