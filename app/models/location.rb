class Location < ActiveRecord::Base
  validates_presence_of :name, :lat, :lng
  validates_uniqueness_of :name

  has_many :users
end
