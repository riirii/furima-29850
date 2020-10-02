class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_from
  belongs_to_active_hash :delivery_day
  belongs_to :user
  has_one    :card, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :image
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :delivery_from_id
      validates :delivery_day_id
    end
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than: 9_999_999 }
  end
end
