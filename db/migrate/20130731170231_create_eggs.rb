class CreateEggs < ActiveRecord::Migration
  def change
    create_table :eggs do |t|
      t.integer :quantity

      t.timestamps

      t.references :chicken
    end
  end
end
