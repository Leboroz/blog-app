require 'rails_helper'
require 'capybara/rspec'

describe 'Posts' do
  before(:each) { get '/users/:user_id/posts' }

  describe 'pages visited', type: :feature do
    it 'should visit main page' do
      visit '/users/1/posts'
      expect(page).to have_text('posts in development')
    end

    it 'should visit user page with Id' do
      visit '/users/1/posts/1'
      expect(page).to have_text('show posts')
    end
  end

  describe 'status ok', type: :request do
    it { expect(response).to have_http_status(200) }
  end
end
