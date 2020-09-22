class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_from
  belongs_to_active_hash :delivery_day
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :explanation
    validates :image
    validates :category_id, numericality: { other_than: 0 } 
    validates :status_id, numericality: { other_than: 0 }
    validates :delivery_fee_id, numericality: { other_than: 0 }
    validates :delivery_from_id, numericality: { other_than: 0 }
    validates :delivery_day_id, numericality: { other_than: 0 }
    validates :price,format: { with: /\A[0-9]+\z/ }, numericality: {greater_than_or_equal_to: 300,less_than: 9999999}
    validates :user
    
    

  end
end
