class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.string :store

      t.timestamps
    end
  end
end
