require 'rails_helper'

RSpec.describe 'Log in', type: :system do
  context 'should have and inputs and buttons' do
    it 'should be present' do
      visit new_user_session_path
      email_field = find_field('Email')
      expect(email_field).to_not be_nil

      password_field = find_field('Password')
      expect(password_field).to_not be_nil

      submit_button = find_button('Log in')
      expect(submit_button).to_not be_nil
    end
  end

  describe 'User login' do
    let(:user) { User.create(name: 'user1', email: 'user1@mail.com', password: '123456') }
    let(:submit) { 'Log in' }

    before :each do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
    end

    context 'without email' do
      it "should return `Email can't be blank` message." do
        fill_in 'user[email]', with: nil
        click_button submit
        expect(page).to have_text('Invalid Email or password.')
      end
    end

    context 'with incorret email' do
      it 'should return `Invalid Email or password.` message.' do
        fill_in 'user[email]', with: 'wrong@example.com'
        click_button submit
        expect(page).to have_text('Invalid Email or password.')
      end
    end

    context 'without password' do
      it "should return `Password can't be blank` message." do
        fill_in 'user[password]', with: nil
        click_button submit
        expect(page).to have_text('Invalid Email or password.')
      end
    end

    context 'with incorret password' do
      it 'should return `Invalid Email or password.` message.' do
        fill_in 'user[password]', with: 'wrong.password'
        click_button submit
        expect(page).to have_text('Invalid Email or password.')
      end
    end

    context 'with complete and correct email and password' do
      it 'should return `Signed in successfully.` message.' do
        click_button submit
        expect(current_path).to eq(groups_path)
        expect(page).to have_text('Signed in successfully.')
      end
    end
  end
end
