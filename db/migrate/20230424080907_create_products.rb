class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, limit: 256
      t.text :description, null: false, limit: 256
      t.decimal :price, null: false, precision: 10, scale: 2

      t.timestamps
    end
  end
end
