class RemoveLocFromOwner < ActiveRecord::Migration
  def up
    remove_column(:owners, :loc)
  end

  def down
  end
end
