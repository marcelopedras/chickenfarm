class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
      t.datetime :active, :null=>false

      t.timestamps
    end
  end
  add_index :farms, :name
end
