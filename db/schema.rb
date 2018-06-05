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

ActiveRecord::Schema.define(version: 2018_06_05_013121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fedex_label_data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tracking_number"
    t.float "file_width"
    t.float "file_height"
    t.float "file_weight"
    t.float "file_length"
    t.string "file_distance_unit"
    t.string "file_mass_unit"
    t.float "api_width"
    t.float "api_height"
    t.float "api_length"
    t.string "api_distance_unit"
    t.float "api_weight"
    t.string "api_weight_unit"
  end

end
