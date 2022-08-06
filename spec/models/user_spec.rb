require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'user1', email: 'user1@mail.com', password: '123456') }

  describe 'validate data' do
    it 'it should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'it should have a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end
