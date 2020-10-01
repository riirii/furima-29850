class CardsController < ApplicationController
  # before_action :authenticate_user!, only: [:new]



  def index
    @item = Item.find(params[:item_id])
    @card = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @card = UserOrder.new(order_params)
    if @card.valid?
      # pay_item
      @card.save
      return redirect_to root_path
    else
      render :index
      # redirect_to item_path(@item.id)
    end
  end



  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality, :address, :tell_number ).merge(user_id: current_user.id,item_id: params[:item_id])
    #:token
  end

  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
  #   Payjp::Charge.create(
  #     amount: order_params[:price],  # 商品の値段
  #     card: order_params[:token],    # カードトークン
  #     currency:'jpy'                 # 通貨の種類(日本円)
  #   )
  # end

end
