require 'rails_helper'

RSpec.feature "Projects", type: :feature do
	context 'create new project' do
		scenario "with valid data" do
			visit new_project_path
			within("form") do	
		    	fill_in 'Title', with: 'Paining job'
		    	fill_in 'Description', with: 'Paining my home. has to be done within a week'
		    	fill_in 'Address', with: 'Belmont, St.George\'s'
		    	select 	'Fixed', from: 'Type'
		    	select 	'Paining', from: 'Project_Category'
		    	fill_in 'Budget', with: 1500
		    	attach_file('Cover image', "#{Rails.root}/spec/fixtures/featured_image.png")
		    	
			end
			click_button 'Create Project'
			expect(page).to have_content("Project created successfully.")
			expect(Project.last.title).to eq("Paining job")
			# expect(page).to have_link 'Sign Out'
    		# expect(page).to have_current_path root_path
		end

		# scenario "should fail" do
		# 	click_button 'Create Account'
		# 	expect(page).to have_content(" Email can\'t be blank")
		# end
	end
end