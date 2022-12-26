class ProductsController < ApplicationController
	def index
		if params[:search].present?
			@products = Product.where("lower(name) LIKE ?", "%#{params[:search].strip.downcase}%").paginate(page: params[:page], per_page: 3)
		else 
			@products = Product.all.paginate(page: params[:page], per_page: 3)
		end
	end
end
