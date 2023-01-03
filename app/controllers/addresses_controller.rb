class AddressesController < ApplicationController
	def index
		@addresses = current_user.addresses
	end

  def edit
    @address = Address.find(params[:id])
  end

	def new	
	    @address = Address.new	
	end

  def show
    @address = Address.find(params[:id])
  end


  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    if @address.save
      redirect_to @address
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to @address
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    redirect_to addresses_path, status: :see_other
  end

  private
    def address_params
      params.require(:address).permit(:country, :post_code, :address, :district)
    end
end