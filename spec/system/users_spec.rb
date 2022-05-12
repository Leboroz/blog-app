require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    driven_by(:rack_test)
  end

  before :all do
    @user = User.find_by(name: 'Tom')
  end

  before :each do
    visit new_user_session_path
    fill_in 'Email', with: 'tom@gmail.com'
    fill_in 'Password', with: 'tom12345'
    click_button 'Log in'
  end

  describe '#index' do
    it 'can see the username of all other users.' do
      expect(page).to have_content(@user.name)
    end

    it 'can see the profile picture for each user.' do
      expect(page).to have_xpath(".//img[@src=\"#{@user.photo}\"]")
    end

    it 'I can see the number of posts each user has written.' do
      expect(page).to have_content("Number of posts: #{@user.post_counter}")
    end

    it "When I click on a user, I am redirected to that user's show page" do
      click_link @user.name

      expect(current_path).to eq("/users/#{@user.id}")
    end
  end

  describe '#show' do
    before :each do
      visit user_path(@user.id)
    end

    it 'should display user profile picture' do
      expect(page).to have_xpath(".//img[@src=\"#{@user.photo}\"]")
    end

    it 'should display user\'s post_counter' do
      expect(page).to have_content("Number of posts: #{@user.post_counter}")
    end

    it 'should display user\'s bio' do
      expect(page).to have_content('Bio')
    end

    it 'should display user\'s most recent posts' do
      @user.most_recent_posts.each { |post| expect(page).to have_content(post.title) }
    end

    it 'should display a button that leads to view all posts' do
      expect(page).to have_content('See all posts')
    end

    context 'When I click on' do
      it 'user\'s post should redirected to show page' do
        post = @user.posts.last

        click_link(post.title)

        expect(current_path).to eql "/users/1/posts/#{post.id}"
      end

      it 'See all posts should redirected to show page' do
        click_link('See all posts')

        expect(current_path).to eql "/users/#{@user.id}/posts"
      end
    end
  end
end
