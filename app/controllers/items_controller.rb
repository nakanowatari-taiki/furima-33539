class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :ceate, :edit, :update]
  def index
      @items = Item.order("created_at DESC")
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

  def show
     @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
    if current_user.id == @item.user_id
    render template: "items/edit"
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to root_path
   else
     render :edit
   end
  end


  private
  def item_params
    params.require(:item).permit(:product_name, :price, :text,  :state_id, :categore_id, :image, :delivery_area_id, :delivery_burden_id, :delivery_days_id ).merge(user_id: current_user.id)
  end
end
