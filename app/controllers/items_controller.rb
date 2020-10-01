class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  # before_action :move_to_index, only: [:]
  before_action :item_record, only: [:show, :edit, :update]
  

  def index
    @items = Item.all.order('created_at DESC')
    @card = Card.distinct.pluck(:item_id)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @card = Card.distinct.pluck(:item_id)
  end

  def edit
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :status_id, :delivery_fee_id, :delivery_from_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def item_record
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
