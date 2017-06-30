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

ActiveRecord::Schema.define(version: 20170630150131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "custom_auto_increments", force: :cascade do |t|
    t.string   "counter_model_name"
    t.integer  "counter",             default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "counter_model_scope"
    t.index ["counter_model_name", "counter_model_scope"], name: "counter_model_name_scope", unique: true, using: :btree
    t.index ["counter_model_name"], name: "index_custom_auto_increments_on_counter_model_name", using: :btree
  end

  create_table "event_venues", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.time     "time"
    t.text     "address"
    t.text     "details"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "workshop"
    t.boolean  "masterclass"
    t.integer  "max_attendees"
    t.integer  "max_volunteers"
  end

  create_table "members", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "volunteer",              default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "postcode"
    t.boolean  "tutor"
    t.index ["email"], name: "index_members_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree
  end

  create_table "memberships", force: :cascade do |t|
    t.string   "membership_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "redirect_url"
    t.string   "response_id"
    t.datetime "expiration_date"
    t.integer  "member_id"
    t.datetime "cancellation_date"
    t.string   "gc_mandate_id"
    t.string   "gc_customer_id"
    t.string   "gc_payment_id"
    t.string   "membership_number"
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "member_id"
    t.boolean  "attending"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "checked_in"
    t.boolean  "volunteering"
    t.string   "stripe_token"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
    t.index ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_name"
    t.string   "contact_email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
