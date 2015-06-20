class Api::PeriodsController < Api::ApiController

  def index
    render json: Period.all
  end

  def show
    period = Period.find(params[:id])
    render json: period.as_json(include:[:performances])
  end

  def create
    period = Period.new(period_params)
    if period.save
      render status: 200, json: {
        message: "Period successfully created",
        period: period
      }.to_json
    else
      render status: 422, json: {
        errors: period.errors,
      }.to_json
    end
  end

  def update
    period = Period.find(params[:id])
    if period.update(period_params)
      render status: 200, json: {
        message: "Period updated successfully",
        period: period
      }.to_json
    else
      render status: 422, json: {
        errors: period.errors,
      }.to_json
    end
  end

  def destroy
    period = Period.find(params[:id])
    period.destroy
    render status: 200, json: {
        message: "Period deleted successfully",
      }.to_json
  end

  private

  def period_params
    params.require(:period).permit(:production, :city, :place, 
                                   :from, :to, :notes, 
                                   performances_attributes: [:date, :time])
  end
end
