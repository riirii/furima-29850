class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @item = Item.new(items_params)
  end

  # def create
  #   @item = Item.create
  # end

  # def create
  #   @room = Room.new(room_params)
  #   if @room.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # private

  # def room_params
  #   params.require(:room).permit(:name, user_ids:[])
  # endprivate

  def items_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :status_id, :delivery_fee_id, :delivery_from_id, :delivery_day_id, :price, :user_id ).merge(user_id: current_user.id)
  end





end













