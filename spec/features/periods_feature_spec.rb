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

  context 'a period has been created' do
    before do
      Period.create(production: 'La Traviata', 
                    city: 'New York', 
                    place: 'Metropolitan Opera', 
                    from: Date.new(2015, 5, 31), 
                    to: Date.new(2015, 06, 10), 
                    notes: '')
    end

    scenario 'should display a list of periods' do
      visit '/periods'
      expect(page).to have_content 'La Traviata'
      expect(page).not_to have_content 'No periods available'
    end
  end

  context 'creating periods' do
    scenario 'prompt the user to fill a form, then displays the new period' do
      create_period
      expect(page).to have_content 'La Traviata'
      expect(current_path).to eq '/periods'
    end
  end
end