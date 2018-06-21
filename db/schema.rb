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

ActiveRecord::Schema.define(version: 2015_12_02_175007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "primary_color"
  end

  create_table "categorizations", id: :serial, force: :cascade do |t|
    t.integer "category_id"
    t.integer "hackathon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "hackathon_count"
    t.integer "hackathon_total_count"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source_url"
    t.string "source_name"
    t.string "teleport_id"
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "time_start"
    t.string "name"
    t.text "description"
    t.integer "hackathon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hackathon_id"], name: "index_events_on_hackathon_id"
  end

  create_table "hackathons", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "country"
    t.string "city_string"
    t.string "url"
    t.datetime "date_start"
    t.datetime "date_end"
    t.string "venue"
    t.string "address"
    t.text "challenge"
    t.text "sponsors"
    t.text "awards"
    t.text "schedule"
    t.boolean "application"
    t.datetime "application_deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.float "longitude"
    t.float "latitude"
    t.string "twitter"
    t.string "image_url"
    t.boolean "highlighted", default: false
    t.integer "days_mask"
    t.string "twitter_hashtag"
    t.integer "city_id"
    t.string "typeform"
    t.index ["city_id"], name: "index_hackathons_on_city_id"
    t.index ["slug"], name: "index_hackathons_on_slug"
  end

  create_table "interests", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "hackathon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", id: :serial, force: :cascade do |t|
    t.integer "organizer_id"
    t.integer "organized_hackathon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organized_hackathon_id"], name: "index_organizations_on_organized_hackathon_id"
    t.index ["organizer_id"], name: "index_organizations_on_organizer_id"
  end

  create_table "relationships", id: :serial, force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "sponsors", id: :serial, force: :cascade do |t|
    t.string "twitter_handle"
    t.string "twitter_image_url"
    t.string "twitter_name"
    t.string "alt_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsorships", id: :serial, force: :cascade do |t|
    t.integer "sponsor_id"
    t.integer "hackathon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twitter_accounts", id: :serial, force: :cascade do |t|
    t.string "provider"
    t.bigint "uid"
    t.string "name"
    t.string "description"
    t.string "token"
    t.string "secret"
    t.string "profile_image"
    t.integer "user_id"
    t.string "username"
    t.string "location"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "twitter_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_reset_token"
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
    t.boolean "admin", default: false
    t.float "radius", default: 150.0
    t.string "location"
    t.boolean "team", default: false
    t.boolean "support", default: false
    t.boolean "organizer", default: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["password_reset_token"], name: "index_users_on_password_reset_token"
  end

  add_foreign_key "events", "hackathons"
  add_foreign_key "hackathons", "cities"
  add_foreign_key "organizations", "hackathons", column: "organized_hackathon_id"
  add_foreign_key "organizations", "users", column: "organizer_id"
end
