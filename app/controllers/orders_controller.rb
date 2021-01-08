class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def create
    @item_order
  end

  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
