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

ActiveRecord::Schema.define(version: 20140202223439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: true do |t|
    t.datetime "scraped_at"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "batches", ["event_id"], name: "index_batches_on_event_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "path"
    t.datetime "start_scraping_at"
    t.datetime "stop_scraping_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "occurs_at"
  end

  create_table "ticket_prices", force: true do |t|
    t.integer  "batch_id"
    t.integer  "price_cents"
    t.string   "section"
    t.integer  "row"
    t.integer  "quantity_min"
    t.integer  "quantity_max"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ticket_prices", ["batch_id"], name: "index_ticket_prices_on_batch_id", using: :btree

end
