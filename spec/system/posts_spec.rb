require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    driven_by(:rack_test)
  end

  before :all do
    @user = User.includes(:posts).find(1)
  end

  before :each do
    visit new_user_session_path
    fill_in 'Email', with: 'tom@gmail.com'
    fill_in 'Password', with: 'tom12345'
    click_button 'Log in'
  end

  describe '#index' do
    before :all do
      @post = @user.posts.first
      @comment = @post.comments.last
      @like = @post.likes.length
    end

    before :each do
      visit user_posts_path(@user.id)
    end

    it 'can see the user\'s profile picture' do
      expect(page).to have_xpath(".//img[@src=\"#{@user.photo}\"]")
    end

    it "can see the user's username" do
      expect(page).to have_content(@user.name)
    end

    it 'can see the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@user.post_counter}")
    end

    it 'can see a post\'s title' do
      expect(page).to have_content(@post.title)
    end

    it 'can see some of the post\'s body' do
      expect(page).to have_content(@post.text)
    end

    it 'can see the first comments on a post' do
      expect(page).to have_content(@comment.text)
    end

    it 'can see how many likes a post has' do
      expect(page).to have_content("likes: #{@like}")
    end

    it 'can see a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('Pagination')
    end

    it 'When I click on a post, it redirects me to that post\'s show page' do
      click_link @post.title

      expect(current_path).to eq("/users/#{@user.id}/posts/#{@post.id}")
    end
  end

  describe '#show' do
    before :all do
      @post = @user.posts.first
      @comment = @post.comments.last
      @like = @post.likes.length
    end

    before :each do
      visit user_post_path(@user.id, @post.id)
    end

    it 'can see the post\'s title' do
      expect(page).to have_content(@post.title)
    end

    it 'can see who wrote the post' do
      expect(page).to have_content(@user.name)
    end

    it 'should have the body' do
      expect(page).to have_content @post.text
    end

    it 'should display all the names of each commentor' do
      @post.comments.each { |comment| expect(page).to have_content comment.author.name }
    end

    it 'should display all the comments of each commentor' do
      @post.comments.each { |comment| expect(page).to have_content comment.text }
    end
  end
end
