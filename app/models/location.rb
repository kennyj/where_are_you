require 'net/http'
require 'uri'
Net::HTTP.version_1_2

class Location < ActiveRecord::Base
  belongs_to :city
  has_many :owners

  UNCODED = 0
  CODED   = 1
  ERROR   = 2

  validates_presence_of :name
  validates_uniqueness_of :name, case_sensitive: false

  before_save do
    self.status = (self.lng && self.lat && UNCODED) ? CODED : UNCODED if self.status != ERROR
  end

  def coded!
    Net::HTTP.start('maps.googleapis.com', 80) { |http|
      self.status = UNCODED
      self.lat = self.lng = self.city = nil
      encoded = URI.escape(name)
      res = http.get "/maps/api/geocode/json?address=#{encoded}&sensor=false"
      if 200.to_s == res.code
        begin
          json = JSON.parse(res.body)
          if "OK" == json["status"]
            location = json["results"][0]["geometry"]["location"]
            self.lat = location["lat"]
            self.lng = location["lng"]
            self.city = City.limit(1).order("power(abs(latitude - #{self.lat}),2) + power(abs(longitude - #{self.lng}),2)")[0]
            logger.debug "name: #{self.city.name} lat: #{self.lat} lng: #{self.lng}"
          else
            logger.debug "It seems that #{name} is invalid address: Status is #{json['status']}"
            self.status = ERROR
          end
        rescue => e
          logger.debug "It seems that #{name} is invalid address: #{e}"
          self.status = ERROR
        end
      else
        logger.debug "Parse error occurs. HTTP response code is #{res.code}"
        self.status = ERROR
      end
      save!
    }
  end
end
