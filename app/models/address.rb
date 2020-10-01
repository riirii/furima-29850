class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :card

  # with_options presence: true do
  #   validates :postal_code
  #   validates :prefecture_id, numericality: { other_than: 0 } 
  #   validates :municipality
  #   validates :address
  #   validates :tell_number
  # end




end
