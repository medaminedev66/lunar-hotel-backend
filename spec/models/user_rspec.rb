require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Amine', email: 'example@mail.com', password: 'password')
  end
  before { subject.save }

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end