class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.belongs_to :user, index: true
      t.belongs_to :repository, index: true
      t.integer :contributions, null: false
      t.timestamps
    end
    add_index :contributors, [:repository_id, :contributions]
  end
end
