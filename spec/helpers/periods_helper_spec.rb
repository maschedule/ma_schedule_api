require 'rails_helper'

module PeriodsHelper
  def create_period(production = 'La Traviata', city = 'New York',
                    place = 'Metropolitan Opera', from_year = '2015',
                    from_month = 'May', from_day = '30',
                    to_year = '2015', to_month = 'June',
                    to_day = '10')
    visit '/periods'
    click_link 'Add a period'
    fill_in_fields(production, city, place)
    select_from_date(from_year, from_month, from_day)
    select_to_date(to_year, to_month, to_day)
    click_button 'Create Period'
  end

  def fill_in_fields(production, city, place)
    fill_in 'Production', with: production
    fill_in 'City', with: city
    fill_in 'Place', with: place
  end

  def select_from_date(year, month, day)
    select year, from: :period_from_1i
    select month, from: :period_from_2i
    select day, from: :period_from_3i
  end

  def select_to_date(year, month, day)
    select year, from: :period_to_1i
    select month, from: :period_to_2i
    select day, from: :period_to_3i
  end
end