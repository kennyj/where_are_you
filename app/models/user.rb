class User < ActiveRecord::Base
  validates_presence_of   :login, :github_id, :type, :name, :email
  validates_uniqueness_of :login, :github_id

  has_many :contributors
end
