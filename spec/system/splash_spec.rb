require 'rails_helper'

RSpec.describe 'Splash screen.', type: :feature do
  before(:all) do
    User.destroy_all
    Group.destroy_all
  end

  before :each do
    visit '/'
  end

  context 'when load the page, it' do
    it 'should display the app name.' do
      expect(page).to have_text('My Budget')
    end

    it 'should display the log in link.' do
      login_link = find_link(href: new_user_session_path)
      expect(login_link).to_not be_nil
    end

    it 'should display the sign up link.' do
      signup_link = find_link(href: new_user_registration_path)
      expect(signup_link).to_not be_nil
    end
  end

  context 'when click on log in link' do
    it 'should redirect to log in form page' do
      click_link 'LOG IN'
      expect(current_path).to eq(new_user_session_path)
    end
  end

  context 'when click on sign up link' do
    it 'should redirect to sign up form page' do
      click_link 'SIGN UP'
      expect(current_path).to eq(new_user_registration_path)
    end
  end
end
