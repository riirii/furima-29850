class CardsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :find_item, only: [:index, :create]

  def index
    card = Card.distinct.pluck(:item_id)
    redirect_to root_path if current_user.id == @item.user.id
    redirect_to root_path if card.include?(@item.id)
    @card = UserOrder.new
  end

  def create
    @card = UserOrder.new(order_params)
    if @card.valid?
      pay_item
      @card.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :municipality, :address, :tell_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end
