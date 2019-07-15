class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :codename
      t.string :address
      t.integer :phone
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :stores, [:user_id, :created_at]
  end
end
