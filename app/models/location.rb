class Location < ActiveRecord::Base
  has_many :owners

  UNCODED = 0
  CODED   = 1

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false

  before_save do
    self.status = (self.lng && self.lat) ? Location::CODED : Location::UNCODED
  end
end
