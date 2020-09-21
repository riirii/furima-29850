class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                      null: false, default: ""
      t.text :explanation,                 null: false 
      t.text :image,                       null: false
      t.integer :category_id,              null: false
      t.integer :status_id,                null: false
      t.integer :delivery_fee_id,          null: false
      t.integer :delivery_from_id,         null: false
      t.integer :delivery_day_id,          null: false
      t.integer :price,                    
      t.references :user,                  foreign_key: true,null: false
      t.timestamps
    end
  end
end
