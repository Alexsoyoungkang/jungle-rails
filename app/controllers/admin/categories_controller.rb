class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  # List all categories
  def index
    @categories = Category.order(id: :desc).all
  end

  # Display a form to create a new category
  def new
    @category = Category.new
  end

  # Create a new category
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end


  # category_params is only available for internal use within the controller.
  private

  # responsible for specifying which parameters from the incoming HTTP request are allowed to be used when creating or updating a category object
  def category_params
    params.require(:category).permit( # we expect a parameter called :category to be present in the request
      :name # specifies which attributes within the :category hash aka the :name attribute and any other attributes in the :category hash will be ignored
    )
  end

end