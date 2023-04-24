class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.string :customer_name, null: false
      t.string :line1, null: false
      t.string :line2
      t.string :street, null: false
      t.string :postal_code, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
