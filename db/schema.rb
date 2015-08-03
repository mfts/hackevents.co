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

ActiveRecord::Schema.define(version: 20150802211408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "primary_color"
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "hackathon_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "hackathons", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "country"
    t.string   "city"
    t.string   "url"
    t.datetime "date_start"
    t.datetime "date_end"
    t.string   "venue"
    t.string   "address"
    t.text     "challenge"
    t.text     "sponsors"
    t.text     "awards"
    t.text     "schedule"
    t.boolean  "application"
    t.datetime "application_deadline"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "slug"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "twitter"
    t.string   "image_url"
    t.boolean  "highlighted",          default: false
    t.integer  "days_mask"
  end

  add_index "hackathons", ["slug"], name: "index_hackathons_on_slug", using: :btree

  create_table "interests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hackathon_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.string   "twitter_handle"
    t.string   "twitter_image_url"
    t.string   "twitter_name"
    t.string   "alt_name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "sponsorships", force: :cascade do |t|
    t.integer  "sponsor_id"
    t.integer  "hackathon_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "twitter_accounts", force: :cascade do |t|
    t.string  "provider"
    t.integer "uid",           limit: 8
    t.string  "name"
    t.string  "description"
    t.string  "token"
    t.string  "secret"
    t.string  "profile_image"
    t.integer "user_id"
    t.string  "username"
    t.string  "location"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "twitter_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "password_reset_token"
    t.boolean  "email_confirmed",      default: false
    t.string   "confirm_token"
    t.boolean  "admin",                default: false
    t.float    "radius",               default: 150.0
    t.string   "location"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["password_reset_token"], name: "index_users_on_password_reset_token", using: :btree

end
