class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_sold_out_or_owner, only: [:index, :create]

  def index
    @order_shipping_address = OrderShippingAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_shipping_address = OrderShippingAddress.new(order_shipping_address_params)

    if @order_shipping_address.valid?
      @order = Order.create(user_id: current_user.id, item_id: params[:item_id])
      @order_shipping_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id]) 
      render :index, status: :unprocessable_entity
    end
  end
  
  private
  
  def order_shipping_address_params
    params.require(:order_shipping_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_sold_out_or_owner
    if @item.order.present? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end
  
end


