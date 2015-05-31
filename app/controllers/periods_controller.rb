class PeriodsController < ApplicationController
  def index
    @periods = Period.all
  end

  def new
    @period = Period.new
  end

  def create
    @period = Period.new(period_params)
    @period.save
    redirect_to periods_path
  end

  def period_params
    params.require(:period).permit(:production, :city, :place, 
                                   :from, :to, :notes)
  end
end
