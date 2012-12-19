class ChangeLocationToLoc < ActiveRecord::Migration
  def up
    rename_column(:owners, :location, :loc)
  end

  def down
    rename_column(:owners, :loc, :location)
  end
end
