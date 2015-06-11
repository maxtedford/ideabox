class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def show
    @user = current_user
  end

private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
