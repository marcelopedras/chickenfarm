class CreateChickens < ActiveRecord::Migration
  def change
    create_table :chickens do |t|
      t.string :chicken_type
      t.datetime :active, :null=>false

      t.timestamps

      t.references :farm
    end
  end
end
