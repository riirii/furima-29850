class Address < ApplicationRecord
  belongs_to :card

  with_options presence: true do
    validates :postal_code
    validates :prefectures_id
    validates :municipalities
    validates :address
    validates :tell_number
  end




end
