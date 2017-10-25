class LineItemsController < ApplicationController

  def create
    @current_cart = Cart.find_by(user_id: current_user.id)
    if @current_cart.nil?
      @current_cart = current_user.carts.build(user_id: current_user.id)
    end
    current_user.current_cart = @current_cart
    item = Item.find_by(id: params[:item_id])

     line_item = @current_cart.add_item(item.id)
     line_item.save

    current_user.save

    redirect_to cart_path(@current_cart)
  end
end
