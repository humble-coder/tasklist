require 'spec_helper'

feature 'User adds task' do

  before(:each) do
  	visit root_path
  	click_link 'New Task'
  end

	scenario 'successfully' do
		fill_in 'Content', with: 'Some Task'
		click_button('Create Task')

		expect(page).to have_content('My Tasks')
		expect(page).to have_content('Some Task')
	end

	scenario 'without filling in name of task' do
		click_button('Create Task')

		expect(page).to have_content("Content can't be blank")
		expect(page).to_not have_content('My Tasks')
	end

	scenario 'but then cancels' do
		click_link('Back')

		expect(page).to have_content('My Tasks')
	end
end