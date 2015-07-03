class Api::UsersController < Api::ApiController

  def show
    render json: User.find(params[:id])
  end
end