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

  def edit
    @period = Period.find(params[:id])
  end

  def update
    @period = Period.find(params[:id])
    @period.update(period_params)
    redirect_to periods_path
  end

  def destroy
    @period = Period.find(params[:id])
    @period.destroy
    flash[:notice] = 'Period deleted successfully'
    redirect_to periods_path
  end

  def period_params
    params.require(:period).permit(:production, :city, :place, 
                                   :from, :to, :notes)
  end
end
