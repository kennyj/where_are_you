# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20121222160651) do

  create_table "cities", force: true do |t|
    t.integer  "geonameid"
    t.string   "name"
    t.string   "asciiname"
    t.text     "alternatenames"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "feature_class"
    t.string   "feature_code"
    t.string   "country_code"
    t.string   "cc2"
    t.string   "admin1_code"
    t.string   "admin2_code"
    t.string   "admin3_code"
    t.string   "admin4_code"
    t.integer  "population"
    t.integer  "elevation"
    t.integer  "dem"
    t.string   "timezone"
    t.date     "modification_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["geonameid"], name: "index_cities_on_geonameid", unique: true

  create_table "contributors", force: true do |t|
    t.integer  "owner_id"
    t.integer  "repository_id"
    t.integer  "contributions", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributors", ["owner_id"], name: "index_contributors_on_owner_id"
  add_index "contributors", ["repository_id", "contributions"], name: "index_contributors_on_repository_id_and_contributions"
  add_index "contributors", ["repository_id"], name: "index_contributors_on_repository_id"

  create_table "locations", force: true do |t|
    t.string   "name",       null: false
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.integer  "city_id"
  end

  add_index "locations", ["name"], name: "index_locations_on_name", unique: true
  add_index "locations", ["updated_at"], name: "index_locations_on_updated_at"

  create_table "owners", force: true do |t|
    t.string   "login",       null: false
    t.integer  "github_id",   null: false
    t.string   "avatar_url"
    t.string   "gravatar_id"
    t.string   "type",        null: false
    t.string   "name"
    t.string   "company"
    t.string   "blog"
    t.string   "email"
    t.boolean  "hireable"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  add_index "owners", ["github_id"], name: "index_owners_on_github_id", unique: true
  add_index "owners", ["login"], name: "index_owners_on_login", unique: true

  create_table "repositories", force: true do |t|
    t.integer  "owner_id"
    t.integer  "github_id",   null: false
    t.string   "name",        null: false
    t.string   "full_name",   null: false
    t.text     "description"
    t.boolean  "fork",        null: false
    t.string   "homepage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "repositories", ["full_name"], name: "index_repositories_on_full_name", unique: true
  add_index "repositories", ["github_id"], name: "index_repositories_on_github_id", unique: true
  add_index "repositories", ["owner_id"], name: "index_repositories_on_owner_id"

end
