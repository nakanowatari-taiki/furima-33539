class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :ceate, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :item_edit, only: [:edit]
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
  end
  
  def edit
    if current_user.id != @item.user_id || @item.item_buy.blank? 
    render template: "items/edit"
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
       redirect_to root_path
   else
     render :edit
   end
  end

  def destroy
    if @item.destroy
       redirect_to("/")
    else
      render  :index
    end
   
  end


  private
  def item_params
    params.require(:item).permit(:product_name, :price, :text,  :state_id, :categore_id, :image, :delivery_area_id, :delivery_burden_id, :delivery_days_id ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_edit
    if (current_user.id != @item.user_id) ||  @item.item_buy.present?
    redirect_to root_path
    end
  end
end
