class UserOrder

  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :tell_number , :item_id , :user_id, :token 
  # :token

  # with_options presence: true do
  #   validates :nickname
  #   validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/ }
  #   validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  #   validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  #   validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  #   validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  #   validates :birthday
  # end

  # with_options presence: true do
  #   validates :name
  #   validates :explanation
  #   validates :image
  #   with_options numericality: { other_than: 0 } do
  #     validates :category_id
  #     validates :status_id
  #     validates :delivery_fee_id
  #     validates :delivery_from_id
  #     validates :delivery_day_id
  #   end
  #   validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than: 9_999_999 }
  # end
  validates :token, presence: true

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 0 } 
    validates :municipality
    validates :address
    validates :tell_number
  end

  def save
    # user = User.create(nickname: nickname, password: password, last_name: last_name, first_name: first_name, last_name_kana: last_name_kana, first_name_kana: first_name_kana, birthday: birthday)
    
    # item = Item.create(name: name, explanation: explanation, image: image, category_id: category_id, status_id: status_id, delivery_fee_id: delivery_fee_id, delivery_from_id: delivery_from_id, delivery_day_id: delivery_day_id, price: price,user_id: user.id)
    card = Card.create(user_id: user_id, item_id: item_id)
    # card = Card.create(user_id: user.id, item_id: item.id)
    # token: token,

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, tell_number: tell_number,card_id: card.id)
    
  end

end
