class AmazonsController < ApplicationController
    # before_action :authenticate_user!
  def index
  	@amazons = Amazon.all
  end

  def edit
    @amazon = Amazon.find(params[:id])
  end

  def show
    @amazon = Amazon.find(params[:id])
  end

  def new
  	@amazon = Amazon.new  
  end


  def create
    @amazon = Amazon.new(amazon_params)
    respond_to do |format|
      if @amazon.save
        format.html { redirect_to amazon_url(@amazon), notice: "amazon was successfully created." }
        format.json { render :show, status: :created, location: @amazon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @amazon.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @amazon = Amazon.find(params[:id])
    respond_to do |format|
      if @amazon.update(amazon_params)
        format.html { redirect_to amazon_url(@amazon), notice: "amazon was successfully updated." }
        format.json { render :show, status: :ok, location: @amazon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @amazon.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @amazon = Amazon.find(params[:id])
    @amazon.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "amazon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def amazon_params
      params.require(:amazon).permit(:name, :email, :mobile_no, :image, :date, :address, :status)
    end
end
