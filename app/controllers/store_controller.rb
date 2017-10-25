class StoreController < ApplicationController
  def index
    @categories = Category.all
    @items = Item.available_items
    @current_cart = Cart.find_by(params[:id])
  end
end
