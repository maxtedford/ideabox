class Admin::CategoriesController < Admin::BaseController

  before_action(:set_category, only: [:show, :edit, :update, :destroy])

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash.notice = "Category '#{@category.name}' Updated!"
      redirect_to admin_category_path(@category)
    else
      render :edit
    end
  end

  def show
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

  def set_category
    @category = Category.find(params[:id])
  end
end



# As a Registered Admin...
#
# When I visit the root path, click "Login", fill in the form and click "Login",
# click the "Categories" link, click the "Add New Category" link,
# fill in the form, then click "Create Category"...
#
# I expect to be redirected to the category show page where I can view all categories.
