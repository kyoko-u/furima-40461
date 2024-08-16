class OrdersController < ApplicationController

  def index
    @order_shipping_address = OrderShippingAddress.new
  end
end
