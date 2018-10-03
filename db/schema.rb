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

ActiveRecord::Schema.define(version: 2018_10_03_212121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "applications", id: :serial, force: :cascade do |t|
    t.text "cover_letter"
    t.string "code_test_url"
    t.boolean "longlist", default: false
    t.boolean "shortlist", default: false
    t.boolean "finalist", default: false
    t.boolean "awarded", default: false
    t.boolean "moderated", default: false
    t.integer "opportunity_id"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "submitted", default: false
    t.text "notes"
    t.boolean "awarded_email_sent", default: false
  end

  create_table "custom_auto_increments", id: :serial, force: :cascade do |t|
    t.string "counter_model_name"
    t.integer "counter", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "counter_model_scope"
    t.index ["counter_model_name", "counter_model_scope"], name: "counter_model_name_scope", unique: true
    t.index ["counter_model_name"], name: "index_custom_auto_increments_on_counter_model_name"
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "donations", id: :serial, force: :cascade do |t|
    t.string "email"
    t.integer "amount"
    t.integer "member_id"
    t.boolean "regular"
    t.boolean "one_off"
    t.string "stripe_subscription_id"
    t.boolean "active_regular_donation", default: false
    t.string "name"
  end

  create_table "event_venues", id: :serial, force: :cascade do |t|
    t.integer "event_id"
    t.integer "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.time "time"
    t.text "address"
    t.text "details"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "workshop"
    t.boolean "masterclass"
    t.integer "max_attendees"
    t.integer "max_volunteers"
    t.integer "price_in_pence"
    t.boolean "refundable"
  end

  create_table "member_skills", id: :serial, force: :cascade do |t|
    t.integer "skill_id"
    t.integer "member_id"
  end

  create_table "members", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "admin", default: false, null: false
    t.boolean "volunteer", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "address_line_one"
    t.string "address_line_two"
    t.string "city"
    t.string "postcode"
    t.boolean "tutor"
    t.string "stripe_source"
    t.string "stripe_customer_id"
    t.boolean "black_woman_nbp", default: false
    t.boolean "contact_permission"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "subscribed_to_email", default: true
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.integer "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["invitation_token"], name: "index_members_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_members_on_invitations_count"
    t.index ["invited_by_id"], name: "index_members_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_members_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "memberships", id: :serial, force: :cascade do |t|
    t.string "membership_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "redirect_url"
    t.string "response_id"
    t.datetime "expiration_date"
    t.integer "member_id"
    t.datetime "cancellation_date"
    t.string "gc_mandate_id"
    t.string "gc_customer_id"
    t.string "gc_payment_id"
    t.string "membership_number"
    t.string "stripe_subscription_id"
  end

  create_table "opportunities", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.text "description"
    t.text "company_bio"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.boolean "external", default: false
  end

  create_table "resources", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "preview_description"
    t.text "description"
    t.string "external_url"
  end

  create_table "rsvps", id: :serial, force: :cascade do |t|
    t.integer "event_id"
    t.integer "member_id"
    t.boolean "attending"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "checked_in"
    t.boolean "volunteering"
    t.string "stripe_token"
    t.string "stripe_charge_token"
    t.boolean "donate", default: false
  end

  create_table "sessions", id: :serial, force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "skills", id: :serial, force: :cascade do |t|
    t.string "name"
  end

  create_table "venues", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact_name"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
