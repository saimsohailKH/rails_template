class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.decimal :sub_total, null: false, precision: 10, scale: 2, default: 0.0
      t.integer :line_items_count, null: false, default: 0

      t.timestamps
    end
  end
end
