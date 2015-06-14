class Admin::UsersController < Admin::BaseController
  def  index

  end

  def show
    @admin_user = User.find(params[:id])
  end
end
