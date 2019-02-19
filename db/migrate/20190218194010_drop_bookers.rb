class DropBookers < ActiveRecord::Migration[5.0]
  def change
    drop_table :bookers
  end
end
