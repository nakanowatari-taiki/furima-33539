class BuyerAreasController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  
  def index
      @item = Item.find(params[:item_id])
      @purchase = Purchase.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  def create
    @item = Item.find(params[:item_id])
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
    params.permit(:phone_number,:postal_code,:delivery_area_id,:municipality,:address,:bulid,:user_id,:item_id,:item_buy_id).merge(token: params[:token],item_id: params[:item_id],user_id: current_user.id)
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],   
      currency: 'jpy'                
    )
  end
 

end
