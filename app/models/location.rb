class Location < ActiveRecord::Base
  UNCODED = 0
  CODED   = 1

  validates_presence_of :name
  validates_uniqueness_of :name

  before_save do
    self.status = (self.lng && self.lat) ? Location::CODED : Location::UNCODED
  end
end
