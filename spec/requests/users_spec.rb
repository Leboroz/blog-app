require 'rails_helper'
require 'capybara/rspec'

describe 'Users' do
  before(:each) { get '/users' }

  describe 'pages visited', type: :feature do
    it 'should visit main page' do
      visit '/users'
      expect(page).to have_text('users in development')
    end

    it 'should visit user page with Id' do
      visit '/users/1'
      expect(page).to have_text('users show')
    end
  end

  describe 'status ok', type: :request do
    it { expect(response).to have_http_status(200) }
  end
end
