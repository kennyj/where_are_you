class AddLocationIdToOwner < ActiveRecord::Migration
  def change
    add_column(:owners, :location_id, :integer, null: true)
  end
end
