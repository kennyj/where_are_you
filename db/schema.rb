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

ActiveRecord::Schema.define(version: 20121217124703) do

  create_table "contributors", force: true do |t|
    t.integer  "user_id"
    t.integer  "repository_id"
    t.integer  "contributions", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributors", ["repository_id", "contributions"], name: "index_contributors_on_repository_id_and_contributions"
  add_index "contributors", ["repository_id"], name: "index_contributors_on_repository_id"
  add_index "contributors", ["user_id"], name: "index_contributors_on_user_id"

  create_table "locations", force: true do |t|
    t.string   "name",       null: false
    t.float    "lat",        null: false
    t.float    "lng",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "locations", ["name"], name: "index_locations_on_name", unique: true
  add_index "locations", ["updated_at"], name: "index_locations_on_updated_at"

  create_table "repositories", force: true do |t|
    t.integer  "user_id"
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
  add_index "repositories", ["user_id"], name: "index_repositories_on_user_id"

  create_table "users", force: true do |t|
    t.string   "login",       null: false
    t.integer  "github_id",   null: false
    t.string   "avatar_url"
    t.string   "gravatar_id"
    t.string   "type",        null: false
    t.string   "name",        null: false
    t.string   "company"
    t.string   "blog"
    t.integer  "location_id", null: false
    t.string   "email",       null: false
    t.boolean  "hireable"
    t.string   "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["github_id"], name: "index_users_on_github_id", unique: true
  add_index "users", ["location_id"], name: "index_users_on_location_id"
  add_index "users", ["login"], name: "index_users_on_login", unique: true

end