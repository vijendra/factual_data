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

ActiveRecord::Schema.define(version: 20141123143833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address_extended"
    t.string   "po_box"
    t.string   "locality"
    t.string   "region"
    t.string   "postcode"
    t.string   "website"
    t.string   "country"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "factual_id"
    t.string   "tel"
    t.string   "fax"
    t.string   "email"
    t.string   "chain_id"
    t.string   "chain_name"
    t.string   "neighborhood",     default: [], array: true
    t.string   "admin_region"
    t.string   "category_ids",     default: [], array: true
    t.string   "category_labels",  default: [], array: true
    t.text     "hours"
    t.string   "hours_display"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
