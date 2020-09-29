class CardsController < ApplicationController

  def index
    @card = Item.find(params[:item_id])
  end

  def create
    @card = Card.new(card_params)
    if @card.valid?
      pay_item
      @card.save
      return redirect_to root_path
    else
      render :index
    end
  end



  private

  def item_params
    params.require(:item).permit(:item_id)
  end

  def card_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: card_params[:price],  # 商品の値段
      card: card_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
