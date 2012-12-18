class Owner < ActiveRecord::Base
  validates_presence_of   :login, :github_id, :type
  validates_uniqueness_of :login, :github_id
end
