class BuyerAreasController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item_buy,only: [:index, :create]
  def index
      @purchase = Purchase.new
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif  current_user.id && @item.item_buy.present? 
      redirect_to root_path
    end
  end
  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
       @purchase.save
       pay_item
       redirect_to root_path
      else
        render action: :index
    end
  end

  private
  def purchase_params
    params.permit(:phone_number,:postal_code,:delivery_area_id,:municipality,:address,:bulid).merge(token: params[:token],item_id: params[:item_id],user_id: current_user.id)
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],   
      currency: 'jpy'                
    )
  end

  def set_item_buy
    @item = Item.find(params[:item_id])
  end
 

end
