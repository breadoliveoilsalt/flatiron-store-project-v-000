class LineItemsController < ApplicationController


  def create
    item = Item.find_by(id: params[:item_id])
    if !cart_active
      current_user.create_current_cart
    end
    if not_already_in_cart?(item)
      add_line_item_to_cart(item)
    else
      increase_quantity_of_line_item(item)
    end
    current_user.save
    redirect_to cart_path(current_user.current_cart.id)
  end

  private

  def not_already_in_cart?(item)
    current_line_items.where(item_id: item.id) == [ ]
  end

  def add_line_item_to_cart(item)
    current_line_items.create(item_id: item.id)
  end

  def increase_quantity_of_line_item(item)
    increased_line_item = current_line_items.find_by(item_id: item.id)
    increased_line_item.quantity += 1
    increased_line_item.save
  end
  
end
