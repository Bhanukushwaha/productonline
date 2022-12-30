class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_cart 
  def current_cart
    if current_user.present?
      return Cart.find_or_create_by(user_id: current_user.id, is_done:false)
    end
  end
end
