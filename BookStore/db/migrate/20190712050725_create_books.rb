class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :books, [:user_id, :created_at]
  end
end
