require 'rails_helper'

module PerformancesHelper

  def create_performance
    visit '/periods'
    click_link 'Add Performance'
    compile_performance_form
    click_button 'Create Performance'
  end

  def compile_performance_form
    select_performance_day
    select_performance_time
  end

  private

  def select_performance_day(year = '2015', month = 'June',
                             day = '5')
    select year, from: "performance_date_1i"
    select month, from: "performance_date_2i"
    select day, from: "performance_date_3i"
  end

  def select_performance_time(hour = '21', minute = '00')
    select hour, from: "performance_time_4i"
    select minute, from: "performance_time_5i"
  end
end
