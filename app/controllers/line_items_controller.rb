class LineItemsController < ApplicationController


    def create
      item = Item.find_by(id: params[:item_id])
      if !current_user.current_cart
        current_user.create_current_cart
      end
      if current_user.current_cart.line_items.where(item_id: item.id) == [ ]
        current_user.current_cart.line_items.create(item_id: item.id)
      else
        increased_line_item = current_user.current_cart.line_items.find_by(item_id: item.id)
        increased_line_item.quantity += 1
        increased_line_item.save
      end
      current_user.save
      redirect_to cart_path(current_user.current_cart.id)
    end

end
