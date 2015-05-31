require 'rails_helper'
require 'helpers/periods_helper_spec'
require 'helpers/performances_helper_spec'

feature 'Performance' do

  include PeriodsHelper
  include PerformancesHelper

  before do
    create_period
  end

  context 'when no performances has been created' do
    scenario 'allows users to create a performance' do
      create_performance
      expect(current_path).to eq '/periods'
      expect(page).to have_content('June 5 2015 21:00')
    end
  end

  context 'after a performance has been created' do
    before do
      create_performance
    end

    scenario 'let a user edit a performance' do
      click_link 'Edit Performance'
      select '7', from: :performance_date_3i
      select '20', from: :performance_time_4i
      select '30', from: :performance_time_5i
      click_button 'Update Performance'
      expect(page).to have_content('June 7 2015 20:30')
    end

    scenario 'let a user delete a performance' do
      click_link 'Delete Performance'
      expect(page).not_to have_content('June 5 2015 21:00')
      expect(page).to have_content 'Performance deleted successfully'
    end
  end

end