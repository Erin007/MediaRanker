class CreateEntertainmentoptions < ActiveRecord::Migration
  def change
    create_table :entertainmentoptions do |t|
      t.string :mediatype
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
