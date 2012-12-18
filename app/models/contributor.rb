class Contributor < ActiveRecord::Base
  validates_presence_of :owner_id, :repository_id, :contributions
  belongs_to :owner
  belongs_to :repository
end
