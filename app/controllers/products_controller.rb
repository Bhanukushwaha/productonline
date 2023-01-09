class ProductsController < ApplicationController
	  # skip_before_action :authenticate_use
	  # skip_before_filter :verify_authenticity_token r!
	def index
		if params[:search].present?
			@products = Product.where("lower(name) LIKE ? OR lower(description) LIKE ?", "%#{params[:search].strip.downcase}%","%#{params[:search].strip.downcase}%").paginate(page: params[:page], per_page: 10)
		else 
			@products = Product.all.paginate(page: params[:page], per_page: 10)
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def add_cart
			@product =  Product.find(params[:product_id])
			cart_items = current_cart.cart_items.where(product_id: @product.id)
      if cart_items.present?


      	item = cart_items.first
        item.quantity = item.quantity.to_i + 1
        item.price = ((item.quantity.to_i) * item.unit_price.to_i).to_f
        item.save
        redirect_back fallback_location: root_path, notice: "Product successfully added to the cart"
      else
				current_cart.cart_items.create(product_id: @product.id, unit_price: @product.price.to_i, price: @product.price.to_i)
				redirect_to carts_path, notice: 'Added to Cart'
			end		
	end	
	def remove_cart
    @product = Product.find(params[:product_id])
    current_cart.cart_items.where(product_id: @product.id).first.destroy
    redirect_to "/carts"
  end
end
