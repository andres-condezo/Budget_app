require 'rails_helper'

RSpec.describe 'Group', type: :system do
  describe 'grouop page' do
    before(:all) do
      User.destroy_all
      Group.destroy_all
    end
    before(:each) do
      @user = User.new(name: 'user1', email: 'user1@mail.com', password: '123456')
      @user.save
      @group = Group.new(name: 'group1',
                         icon: Rack::Test::UploadedFile.new('spec/book_icon.png', 'image/png'),
                         author_id: @user.id)
      @group.save
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    it 'should display the title' do
      expect(page).to have_text('CATEGORIES')
    end

    it 'shows a new category' do
      expect(page).to have_text('group1')
    end

    it "has an 'Add category' button" do
      expect(page).to have_link('NEW CATEGORY')
    end

    it 'should redirect to the new category form path' do
      click_link(href: new_group_path(@user))
      expect(current_path).to eq(new_group_path(@user))
    end
  end
end
