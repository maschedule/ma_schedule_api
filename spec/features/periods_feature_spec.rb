require 'rails_helper'
require 'helpers/periods_helper_spec'

feature 'Periods' do

  include PeriodsHelper
  
  context 'no periods have been added' do
    scenario 'should display a message that no periods are available' do
      visit '/periods'
      expect(page).to have_content 'No periods available'
      expect(page).to have_content 'Add a period'
    end
  end

  context 'creating periods' do
    scenario 'prompt the user to fill a form, then displays the new period' do
      create_period
      expect(page).to have_content 'La Traviata'
      expect(current_path).to eq '/periods'
    end
  end

  context 'a period has been created' do
    before do
      create_period
    end

    scenario 'should display a list of periods' do
      expect(page).to have_content 'La Traviata'
      expect(page).not_to have_content 'No periods available'
    end

    scenario 'let a user edit a period' do
     click_link 'Edit'
     fill_in 'Production', with: 'La Boheme'
     click_button 'Update Period'
     expect(page).to have_content 'La Boheme'
     expect(current_path).to eq '/periods'
    end

    scenario 'removes a period when a user clicks a delete link' do
      click_link 'Delete'
      expect(page).not_to have_content 'La Traviata'
      expect(page).to have_content 'Period deleted successfully'
    end
  end
end