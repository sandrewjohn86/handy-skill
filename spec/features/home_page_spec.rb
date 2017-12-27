require 'rails_helper'

feature 'home page' do 
	scenario 'hero message' do
		visit('/')
		expect(page).to have_content('Welcome to handy skill')
	end
	
end