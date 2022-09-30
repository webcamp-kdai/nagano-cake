class Public::CartItemsController < ApplicationController

  def create
    binding.pry
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
  end

  def index
    @cart_item = CartItems.all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end

end
