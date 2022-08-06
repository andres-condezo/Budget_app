require 'rails_helper'

RSpec.describe Budget, type: :model do
  describe 'Test validations' do
    let(:user) { User.create(name: 'user1', email: 'user1@mail.com', password: '123456') }
    let(:group) do
      Group.create(name: 'group1',
                   icon: Rack::Test::UploadedFile.new('spec/book_icon.png', 'image/png'),
                   author_id: user.id)
    end

    let(:budget) { described_class.create(name: 'budget1', amount: 1, author_id: user.id, group_id: group.id) }

    describe 'Validations' do
      context 'when valid' do
        it { expect(budget).to be_valid }
      end

      it 'validates name' do
        budget.name = nil
        expect(budget).not_to be_valid
      end

      it 'validates amount' do
        budget.amount = nil
        expect(budget).not_to be_valid
      end

      it 'validates amount' do
        budget.amount = 10
        expect(budget).to be_valid
      end
    end
  end
end
