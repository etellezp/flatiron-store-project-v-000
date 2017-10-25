class CartsController < ApplicationController
  def show
    @current_cart = Cart.find_by(user_id: params[:id])
  end

  
    def checkout
      @current_cart = Cart.find_by(user_id: params[:id])

      @current_cart.status = "submitted"

      @current_cart.line_items.each do |line_item|
        line_item.item.inventory -= line_item.quantity
        line_item.item.save
      end
      @current_cart.save

      @current_cart.destroy
      redirect_to cart_path(@current_cart)
    end
end
