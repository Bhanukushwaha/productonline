class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

  def category_details
    @category = Category.find(params[:id])
    @products = @category.products.paginate(page: params[:page], per_page: 4) 
  end
end