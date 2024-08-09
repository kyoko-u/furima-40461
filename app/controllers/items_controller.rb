class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.all.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :condition_id, :shipping_free_status_id, :prefecture_id,
                                 :schedule_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def correct_user
    @item = Item.find(params[:id])
    return if current_user.id == @item.user_id

    redirect_to root_path
  end
end
