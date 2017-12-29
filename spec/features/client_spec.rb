require 'rails_helper'

RSpec.feature "Clients", type: :feature do
	context 'create new client' do
		before(:each) do
			visit new_client_registration_path
			fill_in 'First_name', with: 'john'
			fill_in 'Last_name', with: 'Doe'
		    fill_in 'Phone', with: "14734586043"
		    fill_in 'Address', with: "Belmont, St.Georges"
		    fill_in 'Password', with: "password"
		    fill_in 'Password_confirmation', with: "password"
		end

		scenario "should be successful" do
			
			within("form") do	
		    	fill_in 'Email', with: 'john.doe@test.com'
			end
			click_button 'Create Account'
			expect(page).to have_content("Welcome! You have signed up successfully.")
			# expect(page).to have_link 'Sign Out'
    		# expect(page).to have_current_path root_path
		end

		scenario "should fail" do
			click_button 'Create Account'
			expect(page).to have_content(" Email can\'t be blank")
		end
	end	

	context 'signin client' do	

		before(:each) do
			client = Client.create(:fname => 'John', :lname => 'Doe', :email => 'john.doe@test.com', :password => 'password')

		    visit new_client_session_path
		    within("form") do      
		      fill_in 'Password', with: 'password'
		    end
		end


		scenario "should be successful" do
		    
		    fill_in 'Email', with: 'john.doe@test.com'

		    click_button 'Log in'
		    expect(page).to have_content 'Signed in successfully.'
		end

		scenario "should fail" do

		    click_button 'Log in'
		    expect(page).to have_content 'Invalid Email or password'

		    # expect(page).to have_text 'Signed in successfully.'
		    # expect(page).to have_link 'Sign Out'
		    # expect(page).to have_current_path root_path
		end		
	end
end