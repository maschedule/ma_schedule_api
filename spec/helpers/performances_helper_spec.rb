require 'rails_helper'

module PerformancesHelper

  def create_performance(year = '2015', month = 'June',
                         day = '5', hour = '21', 
                         minute = '00')
    visit '/periods'
    click_link 'Add Performance'
    select year, from: :performance_date_1i
    select month, from: :performance_date_2i
    select day, from: :performance_date_3i
    select hour, from: :performance_time_4i
    select minute, from: :performance_time_5i
    click_button 'Create Performance'
  end
end
