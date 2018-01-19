class CartsController < ApplicationController


  def show
    if !active_cart
        flash[:notice] = "Your cart is empty."
    end
  end

  def checkout
    subtract_inventory
    active_cart.status = "submitted"
    active_cart.save
    current_user.current_cart_id = nil
    current_user.save
    flash[:notice] = "Your cart is empty."
    redirect_to cart_path(params[:id])
  end


  private

  def subtract_inventory
    current_line_items.each do |line_item|
        item = Item.find_by(id: line_item.item_id)
        item.inventory -= line_item.quantity
        item.save
    end
  end
end
