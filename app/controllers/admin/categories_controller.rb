class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    # @admin = User.find(params[:id])
    # @category = Category.new(user_id: params[:user_id])
  end

  def edit
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_category_path(@category)
    else
      flash[:errors] = "Please try again!"
      render(:new)
    end
  end

private

  def category_params
    params.require(:category).permit(:name)
  end
end



# As a Registered Admin...
#
# When I visit the root path, click "Login", fill in the form and click "Login",
# click the "Categories" link, click the "Add New Category" link,
# fill in the form, then click "Create Category"...
#
# I expect to be redirected to the category show page where I can view all categories.