class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc) # @products instant variable is sent to index.html.erb template file
  end

  def show
    @product = Product.find params[:id] # @products instant variable is sent to show.html.erb template file
  end

end
