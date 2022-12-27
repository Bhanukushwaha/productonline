class FavoritesController < ApplicationController

	def index
		@favorites = current_user.favorites
		product_ids = @favorites.map(&:product_id)
		@products = Product.where(id: product_ids)
	end	
	def add_favorite
		@product =  Product.find(params[:product_id])
		@favorite = Favorite.create(user_id: current_user.id, product_id: @product.id)
		redirect_to product_path(@product.id), notice: 'Added to favorites'
	end
	def remove_favorite
		@product = Product.find(params[:product_id])
		Favorite.find_by(user_id: current_user.id, product_id: @product.id).destroy
		if params[:remove_by].present?
			redirect_to favorites_path, notice: 'Remove to favorites'
		else
			redirect_to product_path(@product.id), notice: 'Remove to favorites'
		end
	end
end