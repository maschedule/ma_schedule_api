class Api::UsersController < Api::ApiController

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

   def create
    user = User.new(user_params)
    if user.save
      render status: 200, json: {
        message: "User successfully created",
        user: user
      }.to_json
    else
      render status: 422, json: {
        errors: user.errors,
      }.to_json
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render status: 200, json: {
        message: "User updated successfully",
        user: user
      }.to_json
    else
      render status: 422, json: {
        errors: user.errors,
      }.to_json
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render status: 200, json: {
        message: "User deleted successfully",
      }.to_json
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end