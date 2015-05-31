require 'rails_helper'
require 'helpers/periods_helper_spec'
require 'helpers/performances_helper_spec'


feature 'Main Page' do
  include PeriodsHelper
  include PerformancesHelper

  context 'in main index page' do

    context 'if no period and performances has been added' do
      scenario 'the page show no performance available message' do
        visit '/main'
        expect(page).to have_content 'No performances available'
      end

      scenario 'the page provide a link to the period page' do
        visit '/main'
        click_link 'Periods'
        expect(current_path).to eq '/periods'
      end

      scenario 'the page provide a link to add a period' do
        visit '/main'
        click_link 'Add Period'
        expect(current_path).to eq '/periods/new'
      end
    end

    context 'if a period and a performance has been added' do
      before do
        create_period
        create_performance
      end

      scenario 'a user should see the list of performances' do
        visit '/main'
        expect(page).to have_content 'La Traviata'
        expect(page).to have_content 'June 5 2015 21:00'
      end
    end
  end
end