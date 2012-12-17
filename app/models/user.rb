class User < ActiveRecord::Base
  belongs_to :location
  has_many :contributors
  validates_presence_of :login, :github_id, :type, :name, :location_id, :email
  validates_uniqueness_of :login, :github_id
end
