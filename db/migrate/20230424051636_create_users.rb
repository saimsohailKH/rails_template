class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, limit: 256, unique: true
      t.string :password_digest
      t.string :type

      t.timestamps
    end
  end
end
