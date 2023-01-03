class ApplicationController < ActionController::Base

  helper_method :current_cart 
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_cart
    if current_user.present?
      return Cart.find_or_create_by(user_id: current_user.id, is_done:false)
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :phone_no, :password_confirmation,:password])
  end
end
