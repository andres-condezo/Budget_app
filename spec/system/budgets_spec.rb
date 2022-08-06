require 'rails_helper'

RSpec.describe 'budgets', type: :system do
  describe 'group page' do
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

      @budget = Budget.new(name: 'budget1',
                           amount: 2,
                           author_id: @user.id,
                           group_id: @group.id)
      @budget.save

      @budget2 = Budget.new(name: 'budget2',
                            amount: 4,
                            author_id: @user.id,
                            group_id: @group.id)
      @budget2.save
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    it 'shows a new category' do
      expect(page).to have_text('group1')
    end

    it 'shows the total amount field' do
      expect(page).to have_text(6)
    end

    it "has an 'Add category' button" do
      expect(page).to have_link('NEW CATEGORY')
    end
  end

  describe 'budgets page' do
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

      @budget = Budget.new(name: 'budget1',
                           amount: 2,
                           author_id: @user.id,
                           group_id: @group.id)
      @budget.save

      @budget2 = Budget.new(name: 'budget2',
                            amount: 4,
                            author_id: @user.id,
                            group_id: @group.id)
      @budget2.save
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      click_link 'group1'
    end

    it 'redirects to new budget' do
      expect(page).to have_text('TRANSACTIONS')
    end

    it 'shows the amount field' do
      click_link 'NEW TRANSACTION'
      expect(page).to have_text('Amount')
    end

    it 'creates a new transaction' do
      click_link 'NEW TRANSACTION'
      fill_in 'Name', with: 'Name1'
      fill_in 'Amount', with: '3'
      click_button 'SAVE'
      expect(page).to have_content('group1')
    end
  end
end
