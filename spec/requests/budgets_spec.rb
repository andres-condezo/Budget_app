require 'rails_helper'

RSpec.describe 'Budgets', type: :request do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.new(name: 'user1', email: 'user1@mail.com', password: '123456')
    @user.save

    @group = Group.new(name: 'group1',
                       icon: Rack::Test::UploadedFile.new('spec/book_icon.png', 'image/png'),
                       author_id: @user.id)
    @group.save

    @budget = Budget.new(name: 'budget1',
                         amount: 2,
                         author_id: @user.id,
                         group_id: @group.id)
    @budget.save
  end

  describe 'GET /index' do
    before do
      sign_in user
      get category_path(@group.id)
    end
  end
end
