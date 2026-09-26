require 'rails_helper'

RSpec.describe 'Log in', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'loads' do
    before :each do
      visit new_user_session_path
    end

    it 'the username and password inputs and the "Submit" button.' do
      expect(page).to have_content 'Email'

      expect(page).to have_content 'Password'

      expect(page).to have_content 'Sign up'
    end

    it 'without data should get a detailed error when I click the submit button
    without filling in the username and the password.' do
      click_button 'Log in'

      expect(page).to have_content 'Invalid Email or password'
    end

    it 'with data should get a detailed error when I click the submit button
    after filling in the username and the password with incorrect data' do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'

      click_button 'Log in'

      expect(page).to have_content 'Invalid Email or password'
    end

    it 'with data should not get a detailed error when I click the submit button
    after filling in the username and the password with correct data' do
      User.create(name: 'Leo', email: 'user@example.com', password: 'password', password_confirmation: 'password')

      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'

      click_button 'Log in'

      expect(page).to have_content 'Signed in successfully.'
    end
  end
end
