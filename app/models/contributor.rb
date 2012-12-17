class Contributor < ActiveRecord::Base
  belongs_to :user
  belongs_to :repository
  validates_presence_of :user_id, :repository_id, :contributions
end
