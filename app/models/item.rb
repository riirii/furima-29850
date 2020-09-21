class Item < ApplicationRecord

  belongs_to :user
  
  validates :name, presence: true
  validates :explanation, presence: true
  validates :image, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :delivery_from_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true

end
