class OrdersController < InheritedResources::Base
  before_action :authenticate_user!
  def order_pdf
    @orders = current_user.orders
     respond_to do |format|
      format.html
      format.pdf do
        render pdf: "order_pdf"   # Excluding ".pdf" extension.
      end
    end  
  end
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])  
    # @product = @order.product
    @cart_item = CartItem.find(params[:cart_item])
    @product = Product.unscoped.find(@cart_item.product_id)
    @reviews = @product.reviews.to_a
    @avg_rating = if @reviews.blank?
    else
      @product.reviews.average(:rating).present? ? @product.reviews.average(:rating).round(2) : 0
    end

    if current_user.reviews.where(product_id: @product.id).any?
      @review = current_user.reviews.where(product_id: @product.id).first
    else
      @review = Review.new
    end
  end

  def delevery
    address = Address.find(params[:order][:address_id])  
    @order = Order.new(order_params)
    @order.country = address.country
    @order.postal_code = address.post_code
    @order.address = address.address
    @order.town = @order.district = address.district    
    @order.order_type = "Cash on Delevery"
    @order.description = 'Rails Stripe customer'
    @order.cart_id = current_cart.id
    @order.price = charge.amount
    respond_to do |format|
      if @order.save
        current_cart.update(is_done: true)
        # UserMailer.order_product(current_user).deliver_later
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  def create
    # @product = Product.find(params[:order][:product_id])
    # @cart = Cart.find(params[:order][:cart_id])
    if params[:order][:cash_on_delivery] =! "cash_on_delivery"
      customer = Stripe::Customer.create({email: params[:stripeEmail], source: params[:stripeToken],})
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: current_cart.sub_total.to_i,
        description: 'Rails Stripe customer',
        currency: 'usd',        
      })
    end
    address = Address.find(params[:order][:address_id])  
    @order = Order.new(order_params)
    @order.country = address.country
    @order.postal_code = address.post_code
    @order.address = address.address
    @order.town = @order.district = address.district
    @order.customer = customer&.id ? customer&.id : nil
    @order.order_type = "online Paid"
    @order.description = 'Rails Stripe customer'
    @order.cart_id = current_cart.id
    if params[:order][:cash_on_delivery] =! "cash_on_delivery"
      @order.price = charge.amount
    else
      @order.price = current_cart.sub_total
    end
    respond_to do |format|
      if @order.save
        current_cart.update(is_done: true)
        # UserMailer.order_product(current_user).deliver_later
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :cart_id, :product_id, :price, :decimal, :quantity, :first_name, :last_name, :email, :phone, :country, :address, :town, :district, :postal_code, :description, :address_id)
  end
end
