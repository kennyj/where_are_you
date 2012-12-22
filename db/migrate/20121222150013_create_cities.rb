class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :geonameid # integer id of record in geonames database
      t.string  :name      # name of geographical point (utf8) varchar(200)
      t.string  :asciiname # name of geographical point in plain ascii characters, varchar(200)
      t.text    :alternatenames # alternatenames, comma separated varchar(5000)
      t.float   :latitude       # latitude in decimal degrees (wgs84)
      t.float   :longitude      # longitude in decimal degrees (wgs84)
      t.string  :feature_class  # see http://www.geonames.org/export/codes.html, char(1)
      t.string  :feature_code   # see http://www.geonames.org/export/codes.html, varchar(10)
      t.string  :country_code   # ISO-3166 2-letter country code, 2 characters
      t.string  :cc2            # alternate country codes, comma separated, ISO-3166 2-letter country code, 60 characters
      t.string  :admin1_code    # fipscode (subject to change to iso code), see exceptions below, see file admin1Codes.txt for display names of this code; varchar(20)
      t.string  :admin2_code    # code for the second administrative division, a county in the US, see file admin2Codes.txt; varchar(80) 
      t.string  :admin3_code    # code for third level administrative division, varchar(20)
      t.string  :admin4_code    # code for fourth level administrative division, varchar(20)
      t.integer :population     # bigint (8 byte int) 
      t.integer :elevation      # in meters, integer
      t.integer :dem            # digital elevation model, srtm3 or gtopo30, average elevation of 3''x3'' (ca 90mx90m) or 30''x30'' (ca 900mx900m) area in meters, integer. srtm processed by cgiar/ciat.
      t.string  :timezone       # the timezone id (see file timeZone.txt) varchar(40)
      t.date    :modification_date # date of last modification in yyyy-MM-dd format
      t.timestamps
    end
    add_index :cities, :geonameid, unique: true
  end
end
