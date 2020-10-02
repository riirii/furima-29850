require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_order.postal_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Postal code is invalid')
    end

    it 'prefecture_idが空だと保存できないこと' do
      @user_order.prefecture_id = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
    end

    it 'prefecture_idが0だと保存できないこと' do
      @user_order.prefecture_id = 0
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Prefecture must be other than 0')
    end

    it 'municipalityが空だと保存できないこと' do
      @user_order.municipality = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'addressが空だと保存できないこと' do
      @user_order.address = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address can't be blank")
    end

    it 'building_nameは空でも保存できること' do
      @user_order.building_name = nil
      expect(@user_order).to be_valid
    end

    it 'tell_numberが空だと保存できないこと' do
      @user_order.tell_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Tell number can't be blank", 'Tell number is invalid')
    end

    it 'tell_numberが12桁以上だと保存できないこと' do
      @user_order.tell_number = '090123456789'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Tell number is invalid')
    end

    it 'tokenが空だと保存できないこと' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
