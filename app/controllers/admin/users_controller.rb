class Admin::CategoriesController < Admin::BaseController
  def  index

  end

  def show
    @admin_user = current_admin
  end
end
