class OrdersController < ApplicationController

  def index
    @order_shipping_address = OrderShippingAddress.new
    @item = Item.find(params[:item_id])
  end
end


