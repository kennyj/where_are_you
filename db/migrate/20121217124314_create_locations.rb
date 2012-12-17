class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.float  :lat,  null: false
      t.float  :lng,  null: false
      t.timestamps
    end
    add_index :locations, :name, unique: true
    add_index :locations, :updated_at
  end
end
