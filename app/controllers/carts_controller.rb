class CartsController < ApplicationController


  def show

    if !current_user.current_cart
        flash[:notice] = "Your cart is empty."
    end

  end

  def checkout

    current_user.current_cart.line_items.each do |line_item|
        item = Item.find_by(id: line_item.item_id)
        item.inventory -= line_item.quantity
        item.save
    end

    current_user.current_cart = nil
    current_user.save
    flash[:notice] = "Your cart is empty."
    redirect_to cart_path(params[:id])
  end
end
