class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.belongs_to :owner, index: true
      t.integer :github_id, null: false
      t.string  :name, null: false
      t.string  :full_name, null: false
      t.text    :description
      t.boolean :fork, null: false
      t.string  :homepage
      t.timestamps
    end
    add_index :repositories, :github_id, unique: true
    add_index :repositories, :full_name, unique: true
  end
end
