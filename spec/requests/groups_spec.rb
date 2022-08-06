require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  include Devise::Test::IntegrationHelpers

  before(:each) do
    @user = User.new(name: 'user1', email: 'user1@mail.com', password: '123456')
    @user.save

    @group = Group.new(name: 'group1',
                       icon: Rack::Test::UploadedFile.new('spec/book_icon.png', 'image/png'),
                       author_id: @user.id)
    @group.save
  end

  describe 'GET#index' do
    before do
      sign_in @user
      get groups_path
    end

    it 'response to html' do
      expect(response.content_type).to include 'text/html'
    end
  end

  describe 'GET#new' do
    before do
      sign_in @user
      get groups_path
      get new_group_path
    end

    it 'responds to html' do
      expect(response.content_type).to include 'text/html'
    end
  end
end
