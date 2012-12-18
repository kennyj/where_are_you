class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string  :login, null: false
      t.integer :github_id, null: false
      t.string  :avatar_url
      t.string  :gravatar_id
      t.string  :type, null: false
      t.string  :name
      t.string  :company
      t.string  :blog
      t.string  :location
      t.string  :email
      t.boolean :hireable
      t.string  :bio
      t.timestamps
    end
    add_index :owners, :login, unique: true
    add_index :owners, :github_id, unique: true
  end
end
