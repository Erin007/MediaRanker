class CreateEntertainments < ActiveRecord::Migration
  def change
    create_table :entertainments do |t|
      t.string :type
      t.string :name
      t.string :author
      t.string :artist
      t.string :director
      t.text :description
      t.integer :votes

      t.timestamps null: false
    end
  end
end
