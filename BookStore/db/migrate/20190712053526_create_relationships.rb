class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :store, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
