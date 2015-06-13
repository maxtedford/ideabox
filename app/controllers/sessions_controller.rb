class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.admin?
        redirect_to admin_user_path(@user)
      else
        redirect_to user_path(@user)
      end
    else
      flash.now[:errors] = "Invalid login credentials. Please try again"
      render login_path
    end
  end
end
