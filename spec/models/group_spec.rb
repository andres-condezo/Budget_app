require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'user1', email: 'user1@mail.com', password: '123456') }
  let(:group) do
    described_class.create(name: 'group1',
                           icon: Rack::Test::UploadedFile.new('spec/book_icon.png', 'image/png'),
                           author_id: user.id)
  end

  describe 'Validations' do
    context 'when valid' do
      it { expect(group).to be_valid }
    end

    it 'allows valid name' do
      group.name = 'user1'
      expect(group).to be_valid
    end

    it 'allows valid author_id' do
      group.author_id = nil
      expect(group).not_to be_valid
    end
  end
end
