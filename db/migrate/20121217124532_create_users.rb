class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :login, null: false
      t.integer :github_id, null: false
      t.string  :avatar_url
      t.string  :gravatar_id
      t.string  :type, null: false
      t.string  :name, null: false
      t.string  :company
      t.string  :blog
      t.belongs_to :location, index: true, null: false
      t.string  :email, null: false
      t.boolean :hireable
      t.string  :bio
      t.timestamps
    end
    add_index :users, :login, unique: true
    add_index :users, :github_id, unique: true
  end
end
