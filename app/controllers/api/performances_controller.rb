class Api::PerformancesController < Api::ApiController
  before_filter :find_period

  def create
    performance = @period.performances.create(performance_params)
    if performance.save
      render status: 200, json: {
        message: "Performance created successfully",
        period: @period,
        performance: performance
      }.to_json
    else
      render status: 422, json: {
        errors: performance.errors,
      }.to_json
    end
  end

  def update
    performance = @period.performances.find(params[:id])
    if performance.update(performance_params)
      render status: 200, json: {
        message: "Performance updated successfully",
        period: @period,
        performance: performance
      }.to_json
    else
      render status: 422, json: {
        errors: performance.errors,
      }.to_json
    end
  end

  def destroy
    performance = @period.performances.find(params[:id])
    performance.destroy
    render status: 200, json: {
      message: "Performance deleted successfully",
    }.to_json
  end

  private

  def performance_params
    params.require(:performance).permit(:date, :time)
  end

  def find_period
    @period = Period.find(params[:period_id])
  end
end
