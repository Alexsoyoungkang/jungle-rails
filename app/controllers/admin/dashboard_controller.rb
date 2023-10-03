class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']
  
  def show
    @product_count = Product.count # creates instant variables for a count of how many products are in the database
    @category_count = Category.count # same for category - they are sent to show.html.erb in views/admin/dashboard
  end
end
