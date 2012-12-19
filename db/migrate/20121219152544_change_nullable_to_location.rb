class ChangeNullableToLocation < ActiveRecord::Migration
  def up
    change_column(:locations, :lat, :float, null: true)
    change_column(:locations, :lng, :float, null: true)
    add_column(:locations, :status, :integer)
  end

  def down
    remove_column(:locations, :status)
    change_column(:locations, :lng, :float, null: false)
    change_column(:locations, :lat, :float, null: false)
  end
end
