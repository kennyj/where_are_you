class Repository < ActiveRecord::Base
  validates_presence_of :github_id, :name, :user_id, :full_name, :fork
  validates_uniqueness_of :github_id, :full_name

  belongs_to :user
  has_many :contributors
end
