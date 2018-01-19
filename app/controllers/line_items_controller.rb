class LineItemsController < ApplicationController

  def create
    item_id = params[:item_id].to_i
    if !active_cart
      current_user.create_current_cart(user_id: current_user.id)
    end
    active_cart.add_item(item_id).save
    current_user.save
    redirect_to cart_path(current_user.current_cart.id)
  end

end
