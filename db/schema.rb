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

ActiveRecord::Schema.define(version: 20150811104441) do

  create_table "geo_urls", force: :cascade do |t|
    t.integer  "nfc_urls_id"
    t.integer  "nfc_url_id"
    t.string   "url_1"
    t.string   "location_1"
    t.string   "url_2"
    t.string   "location_2"
    t.string   "url_3"
    t.string   "location_3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "geo_urls", ["nfc_urls_id"], name: "index_geo_urls_on_nfc_urls_id"

  create_table "nfc_urls", force: :cascade do |t|
    t.string   "cardid"
    t.string   "behaviour"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "random_url_id"
    t.integer  "geo_url_id"
    t.integer  "weather_url_id"
  end

  create_table "random_urls", force: :cascade do |t|
    t.integer  "nfc_urls_id"
    t.integer  "nfc_url_id"
    t.string   "url_1"
    t.string   "url_2"
    t.string   "url_3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "random_urls", ["nfc_urls_id"], name: "index_random_urls_on_nfc_urls_id"

  create_table "weather_urls", force: :cascade do |t|
    t.integer  "nfc_urls_id"
    t.integer  "nfc_url_id"
    t.string   "url_1"
    t.string   "weather_1"
    t.string   "url_2"
    t.string   "weather_2"
    t.string   "url_3"
    t.string   "weather_3"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "weather_urls", ["nfc_urls_id"], name: "index_weather_urls_on_nfc_urls_id"

end
