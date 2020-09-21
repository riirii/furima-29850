class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                      null: false, default: ""
      t.text :explanation,                 null: false, default: ""
      t.text :image,                       null: false, default: ""
      t.integer :category_id,              null: false, default: ""
      t.integer :status_id,                null: false, default: ""
      t.integer :delivery_fee_id,          null: false, default: ""
      t.integer :delivery_from_id,         null: false, default: ""
      t.integer :delivery_day_id,          null: false, default: ""
      t.integer :price,                    null: false, default: ""
      t.references :user,                  foreign_key: true
      t.timestamps
    end
  end
end
