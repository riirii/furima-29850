class CardsController < ApplicationController

  def index
    @card = Card.new
  end

  def create
    # @card = Card.new()
  end




















  private

  def item_params
    params.require(:item).permit(item_id: @item.id, user_id: @item.user.id).merge(item_id: @item.id, user_id: @item.user.id)
  end




end
