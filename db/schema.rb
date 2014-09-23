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

ActiveRecord::Schema.define(version: 20140922200807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.string   "player_one"
    t.string   "player_two"
    t.string   "player_one_ship_location"
    t.string   "player_two_ship_location"
    t.boolean  "player_one_sunk",          default: false
    t.boolean  "player_two_sunk",          default: false
    t.integer  "turns_played",             default: 0
    t.boolean  "challenge_accepted",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
