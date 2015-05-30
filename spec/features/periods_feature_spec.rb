require 'rails_helper'

feature 'Periods' do
  context 'no periods have been added' do
    scenario 'should display a message that no periods are available' do
      visit '/periods'
      expect(page).to have_content 'No periods available'
    end
  end
end