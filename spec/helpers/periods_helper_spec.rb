require 'rails_helper'

module PeriodsHelper
  def create_period
    visit '/periods'
    click_link 'Add a period'
    compile_period_form
    click_button 'Create Period'
  end

  def compile_period_form
    fill_in_period_fields
    select_period_from_date
    select_period_to_date
  end

  def compile_nested_performance_form
    select_nested_performance_day
    select_nested_performance_time
  end

  private

  def fill_in_period_fields(production = 'La Traviata', city ='New York', 
                     place = 'Metropolitan Opera')
    fill_in 'Production', with: production
    fill_in 'City', with: city
    fill_in 'Place', with: place
  end

  def select_period_from_date(year = '2015', month = 'May', 
                       day = '30')
    select year, from: :period_from_1i
    select month, from: :period_from_2i
    select day, from: :period_from_3i
  end

  def select_period_to_date(year = '2015', month = 'June', 
                            day = '10')
    select year, from: :period_to_1i
    select month, from: :period_to_2i
    select day, from: :period_to_3i
  end

  def select_nested_performance_day(year = '2015', month = 'June',
                                    day = '5')
    select year, from: nested_attribute('date_1i')
    select month, from: nested_attribute('date_2i')
    select day, from: nested_attribute('date_3i')
  end

  def select_nested_performance_time(hour = '21', minute = '00')
    select hour, from: nested_attribute('time_4i')
    select minute, from: nested_attribute('time_5i')
  end

  def nested_attribute(id)
    "period_performances_attributes_1_#{id}"
  end
end