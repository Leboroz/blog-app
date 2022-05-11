require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

	context "Log in" do
		
		before :all do
			@user = User.find_by(name: 'Tom')
		end 
		
		before :each do
			visit new_user_session_path
			fill_in "Email", with: 'tom@gmail.com'
			fill_in "Password", with: 'tom12345'
			click_button "Log in"
		end
		
		describe "#index" do
			it "can see the username of all other users." do
				expect(page).to have_content(@user.name)
			end

			it "can see the profile picture for each user." do
				expect(page).to have_selector("img")
			end

			it "I can see the number of posts each user has written." do
				expect(page).to have_content("Number of posts: #{@user.post_counter}")
			end

			it "When I click on a user, I am redirected to that user's show page" do
				click_link @user.name
				
				expect(current_path).to eq("/users/#{@user.id}")
			end

		end

		
	end
end
