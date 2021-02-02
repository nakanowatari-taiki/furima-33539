class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :ceate]
  def index
      @items = Item.all.order("created_at DESC")
  end
  def new
      @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :price, :text,  :state_id, :categore_id, :image, :delivery_area_id, :delivery_burden_id, :delivery_days_id ).merge(user_id: current_user.id)
  end
end
