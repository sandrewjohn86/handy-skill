require 'rails_helper'

feature 'home page' do 
	scenario 'hero message' do
		visit('/')
		expect(page).to have_content('Welcome to handy skill')
	end

	feature 'Navbar Links' do 
		scenario 'Signup should be available' do
			visit('/')
			expect(page).to have_link('Signup')
		end

		scenario 'Login should be available' do
			visit('/')
			expect(page).to have_link('Login')
		end

		scenario 'Browse should be available' do
			visit('/')
			expect(page).to have_link('Browse')
		end
	end
end