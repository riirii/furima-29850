require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    # @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it 'name,explanation,image,category_id,status_id,delivery_fee_id,delivery_from_id,delivery_day_id,priceが存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'explanationが空では登録できないこと' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'category_idが0では登録できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 0')
    end

    it 'status_idが0では登録できないこと' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 0')
    end

    it 'delivery_fee_idが0では登録できないこと' do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee must be other than 0')
    end

    it 'delivery_from_idが0では登録できないこと' do
      @item.delivery_from_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery from must be other than 0')
    end

    it 'delivery_day_idが0では登録できないこと' do
      @item.delivery_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery day must be other than 0')
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is invalid', 'Price is not a number')
    end

    it 'priceの範囲が¥300~¥9,999,999以外では登録できないこと' do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceの範囲が¥300~¥9,999,999以外では登録できないこと' do
      @item.price = 100_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 9999999')
    end

    it 'priceが半角数字以外では登録できないこと' do
      @item.price = '１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
