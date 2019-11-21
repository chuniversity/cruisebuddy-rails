# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_19_232001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_profile_id", null: false
    t.bigint "review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_profile_id"], name: "index_comments_on_user_profile_id"
  end

  create_table "cruise_lines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "helpfuls", force: :cascade do |t|
    t.bigint "user_profile_id", null: false
    t.bigint "review_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["review_id"], name: "index_helpfuls_on_review_id"
    t.index ["user_profile_id"], name: "index_helpfuls_on_user_profile_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "name"
    t.bigint "ship_id", null: false
    t.bigint "voyage_port_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ship_id"], name: "index_itineraries_on_ship_id"
    t.index ["voyage_port_id"], name: "index_itineraries_on_voyage_port_id"
  end

  create_table "port_images", force: :cascade do |t|
    t.string "url"
    t.bigint "port_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["port_id"], name: "index_port_images_on_port_id"
  end

  create_table "ports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "body"
    t.integer "rating"
    t.bigint "user_profile_id", null: false
    t.bigint "ship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ship_id"], name: "index_reviews_on_ship_id"
    t.index ["user_profile_id"], name: "index_reviews_on_user_profile_id"
  end

  create_table "ship_images", force: :cascade do |t|
    t.string "url"
    t.bigint "ship_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ship_id"], name: "index_ship_images_on_ship_id"
  end

  create_table "ships", force: :cascade do |t|
    t.string "name"
    t.bigint "cruise_line_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cruise_line_id"], name: "index_ships_on_cruise_line_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "ex_email"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "voyage_ports", force: :cascade do |t|
    t.bigint "port_id", null: false
    t.bigint "voyage_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["port_id"], name: "index_voyage_ports_on_port_id"
    t.index ["voyage_id"], name: "index_voyage_ports_on_voyage_id"
  end

  create_table "voyages", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.bigint "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["region_id"], name: "index_voyages_on_region_id"
  end

  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "user_profiles"
  add_foreign_key "helpfuls", "reviews"
  add_foreign_key "helpfuls", "user_profiles"
  add_foreign_key "itineraries", "ships"
  add_foreign_key "itineraries", "voyage_ports"
  add_foreign_key "port_images", "ports"
  add_foreign_key "reviews", "ships"
  add_foreign_key "reviews", "user_profiles"
  add_foreign_key "ship_images", "ships"
  add_foreign_key "ships", "cruise_lines"
  add_foreign_key "voyage_ports", "ports"
  add_foreign_key "voyage_ports", "voyages"
  add_foreign_key "voyages", "regions"
end
