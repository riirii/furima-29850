class UserOrder
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :tell_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :municipality
    validates :address
    validates :tell_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    card = Card.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, tell_number: tell_number, card_id: card.id)
  end
end
