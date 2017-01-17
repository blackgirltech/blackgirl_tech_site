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

ActiveRecord::Schema.define(version: 20170117153345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "email"
    t.boolean  "admin"
    t.string   "time_zone"
    t.string   "crypted_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "alerts", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.boolean  "resolved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "answers", force: :cascade do |t|
    t.text     "text"
    t.integer  "survey_id"
    t.integer  "question_id"
    t.integer  "survey_taker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "likes"
    t.text     "file_name"
    t.text     "file_uid"
    t.index ["question_id"], name: "question_id", using: :btree
  end

  create_table "area_memberships", force: :cascade do |t|
    t.integer  "area_id"
    t.integer  "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "area_redirects", force: :cascade do |t|
    t.integer  "area_id"
    t.string   "url"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_area_redirects_on_area_id", using: :btree
  end

  create_table "area_zips", force: :cascade do |t|
    t.integer  "area_id"
    t.string   "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areas", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.integer  "mapit"
    t.string   "area_type"
  end

  create_table "cached_counts", force: :cascade do |t|
    t.text     "statement"
    t.integer  "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaign_responses", force: :cascade do |t|
    t.text     "email"
    t.text     "firstname"
    t.text     "lastname"
    t.text     "postcode"
    t.text     "body"
    t.integer  "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaign_tests", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "test_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", force: :cascade do |t|
    t.text     "name"
    t.text     "journey"
    t.text     "intro"
    t.text     "no_decisions"
    t.text     "mail_advice"
    t.text     "thanks_message"
    t.text     "description"
    t.text     "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "live"
    t.string   "redirect_url"
    t.string   "thankyou_from"
    t.string   "thankyou_subject"
    t.text     "thankyou_body"
    t.text     "header"
    t.text     "privacy_statement"
    t.datetime "finishes_at"
    t.text     "finished_message"
    t.string   "actions"
    t.text     "call_advice"
    t.text     "tweet_advice"
    t.boolean  "require_primary"
    t.text     "sign_advice"
    t.text     "internal_name"
    t.text     "area_types"
    t.text     "facebook_advice"
    t.boolean  "test_mode"
    t.string   "slug",                         limit: 255
    t.string   "twilio_number",                limit: 255
    t.text     "fax_advice"
    t.text     "fax_limit"
    t.text     "twilio_voice_intro"
    t.text     "custom_advice"
    t.text     "custom_button_text"
    t.integer  "extra_signatories"
    t.boolean  "rsign_collect_boolean"
    t.text     "rsign_collect_boolean_text"
    t.boolean  "featured"
    t.boolean  "template"
    t.boolean  "rsign_comments"
    t.boolean  "skippable_first_step"
    t.datetime "deleted_at"
    t.boolean  "rmail_bundle_decisions"
    t.text     "share_advice"
    t.boolean  "share_on_donate"
    t.text     "donate_advice"
    t.text     "donation_redirect"
    t.string   "twitter_share_text",           limit: 256
    t.string   "twitter_shortlink",            limit: 256
    t.text     "different_share_url"
    t.text     "background_image"
    t.text     "additional_question_options"
    t.boolean  "show_live_updates"
    t.json     "live_update_texts"
    t.text     "donate_thankyou"
    t.text     "head"
    t.integer  "max_decisions",                                                     default: 0
    t.integer  "pledge_goal"
    t.text     "pledge_advice"
    t.text     "pledge_redirect"
    t.datetime "pledge_close_time"
    t.integer  "donation_goal"
    t.boolean  "no_api_sync"
    t.text     "payu_advice"
    t.integer  "rmail_limit",                                                       default: 0
    t.integer  "rtweet_limit",                                                      default: 0
    t.integer  "locked_by"
    t.datetime "locked_at"
    t.integer  "last_edited_by"
    t.boolean  "show_shared_mails"
    t.boolean  "rmail_address_not_required"
    t.boolean  "donate_tax_deductible"
    t.text     "rdonate_journey_type"
    t.decimal  "payu_goal",                                precision: 10, scale: 2
    t.text     "thankyou_from_email"
    t.text     "thankyou_from_name"
    t.text     "no_areas_redirect"
    t.text     "share_image_url"
    t.boolean  "only_show_relevant_templates"
    t.boolean  "skip_logged_out_share_steps"
    t.string   "rmail_collective"
    t.text     "infobox"
  end

  create_table "decisions", force: :cascade do |t|
    t.integer  "status"
    t.integer  "campaign_id"
    t.integer  "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "secondary"
    t.integer  "order"
    t.text     "display_name"
    t.datetime "deleted_at"
    t.integer  "tweets_received"
    t.integer  "mails_received"
    t.index ["campaign_id"], name: "decisions_campaign_id", using: :btree
    t.index ["representative_id"], name: "decisions_representative_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0
    t.integer  "attempts",   default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.time     "time"
    t.text     "address"
    t.text     "details"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "workshop"
    t.boolean  "masterclass"
  end

  create_table "iframe_urls", force: :cascade do |t|
    t.integer  "campaign_id"
    t.text     "url"
    t.text     "message"
    t.text     "button"
    t.text     "destination_url"
    t.integer  "clicks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "display_delay"
    t.index ["campaign_id"], name: "campaign_id_index", using: :btree
  end

  create_table "live_content", force: :cascade do |t|
    t.integer  "campaign_id"
    t.string   "relation"
    t.string   "type"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", force: :cascade do |t|
    t.text     "name"
    t.text     "logo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "yournextmp"
    t.text     "phone"
  end

  create_table "pledges", force: :cascade do |t|
    t.text     "email"
    t.text     "name"
    t.text     "postcode"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
    t.integer  "amount"
    t.text     "stripe_id"
    t.index ["campaign_id"], name: "campaign_id_pledge_index", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "tech"
    t.boolean  "poem"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_blocks", force: :cascade do |t|
    t.integer "survey_id"
    t.boolean "shuffle"
    t.boolean "page_break"
    t.integer "o"
  end

  create_table "questions", force: :cascade do |t|
    t.text     "text"
    t.boolean  "required"
    t.text     "help"
    t.string   "qtype"
    t.text     "options"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "o"
    t.integer  "question_block_id"
    t.text     "rows"
    t.boolean  "shuffle"
    t.boolean  "is_public"
    t.text     "result_text"
  end

  create_table "rcall_recipients", force: :cascade do |t|
    t.integer  "rcall_id"
    t.integer  "decision_id"
    t.integer  "campaign_id"
    t.integer  "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["campaign_id"], name: "rcall_recipients_campaign_id", using: :btree
    t.index ["decision_id"], name: "rcall_recipients_decision_id", using: :btree
    t.index ["rcall_id"], name: "rcall_recipients_rcall_id", using: :btree
    t.index ["representative_id"], name: "rcall_recipients_representative_id", using: :btree
  end

  create_table "rcall_sessions", force: :cascade do |t|
    t.integer  "campaign_id"
    t.datetime "created_at",        precision: 6
    t.datetime "updated_at",        precision: 6
    t.integer  "representative_id"
    t.text     "twilio_identifier"
    t.text     "call_status"
    t.text     "request_ip"
    t.text     "from_number"
    t.integer  "code"
    t.integer  "duration"
    t.index ["campaign_id"], name: "rcalls_campaign_id_copy", using: :btree
    t.index ["twilio_identifier"], name: "rcall_session_twilio_id", using: :btree
  end

  create_table "rcalls", force: :cascade do |t|
    t.text     "email"
    t.text     "name"
    t.text     "body"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "user_agent_id"
    t.text     "postcode"
    t.string   "country",       limit: 2
    t.index ["campaign_id"], name: "rcalls_campaign_id", using: :btree
  end

  create_table "rdonates", force: :cascade do |t|
    t.text     "email"
    t.text     "name"
    t.text     "postcode"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
    t.integer  "amount"
    t.text     "country"
    t.text     "card_type"
    t.text     "stripe_id"
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "tax_deductible"
    t.text     "address1"
    t.text     "address2"
    t.text     "town"
    t.integer  "user_agent_id"
    t.index ["campaign_id"], name: "campaign_id_donate_index", using: :btree
  end

  create_table "representative_roles", force: :cascade do |t|
    t.integer  "representative_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "representatives", force: :cascade do |t|
    t.text     "name"
    t.text     "photo_url"
    t.text     "email"
    t.text     "phone"
    t.text     "twitter"
    t.text     "rtype"
    t.integer  "party_id"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "yournextmp"
    t.text     "facebook"
    t.boolean  "standing_down"
    t.boolean  "dead_or_otherwise_inactive"
    t.text     "website"
    t.text     "alternative_phone"
    t.text     "mobile_phone"
    t.text     "fax"
    t.datetime "deleted_at"
    t.boolean  "bounced_email"
  end

  create_table "rfacebook_recipients", force: :cascade do |t|
    t.integer  "rfacebook_id"
    t.integer  "campaign_id"
    t.integer  "decision_id"
    t.integer  "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rfacebooks", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.text     "campaign_id_old"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campaign_id"
    t.integer  "source_id"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "user_agent_id"
    t.string   "country",         limit: 2
    t.text     "postcode"
  end

  create_table "rfax", force: :cascade do |t|
    t.text     "email"
    t.text     "name"
    t.text     "body"
    t.text     "address1"
    t.text     "address2"
    t.text     "town"
    t.text     "county"
    t.text     "postcode"
    t.text     "phone"
    t.boolean  "sent"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "user_agent_id"
    t.string   "country",       limit: 2
  end

  create_table "rfax_recipients", force: :cascade do |t|
    t.integer  "rfax_id"
    t.integer  "decision_id"
    t.integer  "campaign_id"
    t.integer  "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rmail_carbon_copies", force: :cascade do |t|
    t.integer  "rmail_id"
    t.integer  "decision_id"
    t.integer  "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campaign_id"
  end

  create_table "rmail_recipients", force: :cascade do |t|
    t.integer  "rmail_id"
    t.integer  "decision_id"
    t.integer  "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campaign_id"
    t.integer  "tries"
    t.string   "rejection_reason"
    t.boolean  "sent"
    t.text     "external_id"
    t.text     "engagement"
    t.text     "engagement_ip"
    t.text     "engagement_location"
    t.index ["campaign_id"], name: "rmail_recipients_campaign_id", using: :btree
    t.index ["decision_id"], name: "rmail_recipients_decision_id", using: :btree
    t.index ["external_id"], name: "rmail_recipients_external_id", using: :btree
    t.index ["representative_id"], name: "rmail_recipients_representative_id", using: :btree
    t.index ["rmail_id"], name: "rmail_recipients_rmail_id", using: :btree
  end

  create_table "rmails", force: :cascade do |t|
    t.text     "email"
    t.text     "name"
    t.text     "subject"
    t.text     "body"
    t.text     "address1"
    t.text     "address2"
    t.text     "town"
    t.text     "county"
    t.text     "postcode"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sent"
    t.text     "phone"
    t.text     "message_id"
    t.integer  "source_id"
    t.string   "firstname"
    t.string   "lastname"
    t.boolean  "shared"
    t.integer  "user_agent_id"
    t.string   "country",       limit: 2
    t.index ["campaign_id"], name: "rmails_campaign_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rpayus", force: :cascade do |t|
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
    t.text     "email"
    t.text     "firstname"
    t.text     "lastname"
    t.text     "postcode"
    t.integer  "amount"
    t.integer  "trans_id"
    t.text     "session_id"
    t.integer  "trans_pos_id"
    t.text     "trans_session_id"
    t.decimal  "trans_amount_ps"
    t.integer  "trans_order_id"
    t.text     "trans_pay_type"
    t.text     "trans_status_code"
    t.text     "thankyou_sent"
    t.string   "country",           limit: 2
    t.integer  "user_agent_id"
    t.index ["campaign_id"], name: "campaign_id_payu_index", using: :btree
  end

  create_table "rshares", force: :cascade do |t|
    t.text     "email"
    t.text     "name"
    t.text     "postcode"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
    t.text     "medium"
    t.string   "tracking_code", limit: 256
    t.text     "recipients"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "user_agent_id"
    t.string   "country",       limit: 2
  end

  create_table "rsign_recipients", force: :cascade do |t|
    t.integer  "rsign_id"
    t.integer  "decision_id"
    t.integer  "campaign_id"
    t.integer  "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["campaign_id"], name: "rsign_recipients_campaign_id", using: :btree
    t.index ["decision_id"], name: "rsign_recipients_decision_id", using: :btree
    t.index ["representative_id"], name: "rsign_recipients_representative_id", using: :btree
    t.index ["rsign_id"], name: "rsign_recipients_rsign_id", using: :btree
  end

  create_table "rsigns", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "postcode"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "boolean_collection"
    t.integer  "source_id"
    t.text     "comment"
    t.integer  "likes"
    t.text     "answer_collection"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "user_agent_id"
    t.string   "country",            limit: 2
    t.index ["campaign_id"], name: "rsigns_campaign_id", using: :btree
    t.index ["comment"], name: "rsign_comment", using: :btree
  end

  create_table "rtweet_recipients", force: :cascade do |t|
    t.integer  "rtweet_id"
    t.integer  "decision_id"
    t.integer  "campaign_id"
    t.integer  "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["campaign_id"], name: "rtweet_recipients_campaign_id", using: :btree
    t.index ["decision_id"], name: "rtweet_recipients_decision_id", using: :btree
    t.index ["representative_id"], name: "rtweet_recipients_representative_id", using: :btree
    t.index ["rtweet_id"], name: "rtweet_recipients_rtweet_id", using: :btree
  end

  create_table "rtweets", force: :cascade do |t|
    t.text     "email"
    t.text     "name"
    t.text     "body"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "source_id"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "user_agent_id"
    t.string   "country",       limit: 2
    t.text     "postcode"
    t.index ["campaign_id"], name: "rtweets_campaign_id", using: :btree
  end

  create_table "short_links", force: :cascade do |t|
    t.text     "long_link"
    t.text     "short_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["long_link"], name: "short_links_index", using: :btree
  end

  create_table "sources", force: :cascade do |t|
    t.text     "source"
    t.text     "medium"
    t.text     "campaign"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["source", "medium", "campaign"], name: "index_sources_on_source_and_medium_and_campaign", unique: true, using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_takers", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "survey_id"
    t.boolean  "share_comment"
    t.integer  "source_id"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "user_agent_id"
    t.string   "country",       limit: 2
  end

  create_table "survey_tests", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "test_id"
    t.index ["survey_id"], name: "survey_tests_survey_id", using: :btree
    t.index ["test_id"], name: "survey_tests_test_id", using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "title"
    t.text     "header"
    t.text     "intro"
    t.string   "redirect_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "image_url"
    t.string   "internal_name"
    t.string   "slug",                 limit: 255
    t.text     "privacy_statement"
    t.boolean  "display_comments"
    t.integer  "comments_question_id"
    t.boolean  "send_to_email"
    t.text     "email_address"
    t.text     "email_subject"
    t.text     "mailing_template"
    t.boolean  "share_comments"
    t.text     "thankyou_from"
    t.text     "thankyou_subject"
    t.text     "thankyou_body"
    t.boolean  "email_copy_to_taker"
    t.text     "background_image"
    t.text     "background_image_url"
    t.integer  "time_estimate"
    t.text     "head"
    t.datetime "survey_close_time"
    t.text     "survey_close_text"
    t.boolean  "no_api_sync"
    t.text     "public_instructions"
  end

  create_table "template_rfaxes", force: :cascade do |t|
    t.text     "body"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "party_id"
    t.integer  "representative_id"
  end

  create_table "template_rmails", force: :cascade do |t|
    t.text     "subject"
    t.text     "body"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "party_id"
    t.integer  "representative_id"
  end

  create_table "template_rtweets", force: :cascade do |t|
    t.text     "body"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipients"
    t.integer  "party_id"
    t.integer  "representative_id"
  end

  create_table "test_cohorts", force: :cascade do |t|
    t.string   "name"
    t.integer  "test_id"
    t.string   "test_script"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", force: :cascade do |t|
    t.string   "name"
    t.string   "element"
    t.string   "experimentId"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "limit_to_campaigns"
    t.boolean  "limit_to_actions"
    t.text     "actions",            array: true
  end

  create_table "tweet_informs", force: :cascade do |t|
    t.string   "twitter"
    t.integer  "tweet_count"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["campaign_id"], name: "campaign_id", using: :btree
  end

  create_table "user_agents", force: :cascade do |t|
    t.string   "user_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "zip_zones", force: :cascade do |t|
    t.integer  "zip_id"
    t.string   "zone_type"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zips", force: :cascade do |t|
    t.string  "zip",                    limit: 20
    t.string  "county",                 limit: 50
    t.string  "lau",                    limit: 2
    t.string  "ward",                   limit: 50
    t.string  "pcon_new",               limit: 200
    t.integer "eer"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "ccg",                    limit: 16
    t.string  "country",                limit: 10
    t.string  "city",                   limit: 60
    t.string  "province",               limit: 20
    t.string  "local_electoral_region", limit: 200
    t.text    "mosaic_group"
    t.text    "mosaic_code"
  end

end
