require 'csv'

class City < ActiveRecord::Base
  def self.import!
    zip_file  = 'cities15000.zip'
    txt_file  = 'cities15000.txt'
    `cd #{Dir.tmpdir}; wget http://download.geonames.org/export/dump/#{zip_file};  unzip -f #{zip_file}`
    open(File.join(Dir.tmpdir, txt_file), "r:utf-8") do |f|
      City.transaction do
        City.delete_all
        while row = f.gets do
          cols = row.strip.split("\t")
          City.create(
            geonameid:        cols[0], 
            name:             cols[1],
            asciiname:        cols[2],
            # alternatenames:   cols[3],
            latitude:         cols[4],
            longitude:        cols[5],
            feature_class:    cols[6],
            feature_code:     cols[7],
            country_code:     cols[8],
            cc2:              cols[9],
            admin1_code:      cols[10],
            admin2_code:      cols[11],
            admin3_code:      cols[12],
            admin4_code:      cols[13],
            population:       cols[14], 
            elevation:        cols[15],
            dem:              cols[16],
            timezone:         cols[17],
            modification_date: cols[18]
          )
        end
      end
    end
  end
end
