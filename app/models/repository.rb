class Repository < ActiveRecord::Base
  belongs_to :user
  has_many :contributors
  validates_presence_of :github_id, :name, :user_id, :full_name, :fork
  validates_uniqueness_of :github_id, :full_name
end
