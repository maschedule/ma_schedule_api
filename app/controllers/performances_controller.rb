class PerformancesController < ApplicationController
  def new
    @period = Period.find(params[:period_id])
    @performance = Performance.new
  end

  def create
    @period = Period.find(params[:period_id])
    @period.performances.create(performance_params)
    redirect_to periods_path
  end

  def performance_params
    params.require(:performance).permit(:date, :time)
  end
end
