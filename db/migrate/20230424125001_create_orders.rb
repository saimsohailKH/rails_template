class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true
      t.integer :status, null: false, default: 0
      t.decimal :total, null: false, default: 0.0

      t.timestamps
    end
  end
end
