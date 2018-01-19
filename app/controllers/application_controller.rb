class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def active_cart
    current_user.current_cart
  end

  def current_line_items
    current_user.current_cart.line_items
  end
end
