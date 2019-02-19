class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.boolean :status, default: false
      t.date :date
      t.integer :price
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
