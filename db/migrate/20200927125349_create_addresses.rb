class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,                null: false, default: ""
      t.string :prefectures_id,             null: false
      t.string :municipalities,             null: false, default: ""
      t.string :address,                    null: false, default: ""
      t.string :building_name,              default: ""
      t.string :tell_number,                null: false, default: ""
      t.references :card,                   foreign_key: true,null: false
      t.timestamps
    end
  end
end
