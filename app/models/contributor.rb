class Contributor < ActiveRecord::Base
  validates_presence_of :user_id, :repository_id, :contributions

  belongs_to :user
  belongs_to :repository
end
