require 'rails_helper'

RSpec.describe User do
  before(:each) { get '/users' }

  describe 'pages visited', type: :feature do
    it 'should visit main page' do
      visit '/users'
      expect(page).to have_text('Log in')
    end

    it 'should visit user page with Id' do
      visit '/users/1'
      expect(page).to have_text('Log in')
    end
  end

  describe 'status ok', type: :request do
    it { expect(response).to have_http_status(302) }
  end
end
