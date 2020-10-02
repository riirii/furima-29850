FactoryBot.define do
  factory :user_order do
    postal_code                    { '123-4567' }
    prefecture_id                  { 1 }
    municipality                   { '渋谷区' }
    address                        { '1-1' }
    building_name                  { 'フレーム神南坂' }
    tell_number                    { '08012345678' }
    token                          { 'tok_abcdefghijk00000000000000000' }
  end
end
