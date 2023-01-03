class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:user_id, :cart_id, :product_id, :price, :decimal, :quantity, :first_name, :last_name, :email, :phone, :country, :address, :town, :district, :postal_code, :description, :address_id)
    end

end
