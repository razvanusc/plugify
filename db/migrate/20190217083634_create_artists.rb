class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :bio
      t.string :genre
      t.integer :price_per_hour

      t.timestamps
    end
  end
end
