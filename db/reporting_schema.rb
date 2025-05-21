# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_21_123442) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "availabilities", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.date "date_start"
    t.date "date_end"
    t.boolean "availability", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_availabilities_on_organization_id"
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "bank_deposits", force: :cascade do |t|
    t.string "name"
    t.date "date_collected"
    t.decimal "amount"
    t.bigint "event_id"
    t.bigint "user_id"
    t.bigint "organization_id"
    t.string "funds_type"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_bank_deposits_on_event_id"
    t.index ["organization_id"], name: "index_bank_deposits_on_organization_id"
    t.index ["user_id"], name: "index_bank_deposits_on_user_id"
  end

  create_table "confirmations", force: :cascade do |t|
    t.string "confirmable_type"
    t.bigint "confirmable_id"
    t.bigint "event_slot_id"
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmable_type", "confirmable_id"], name: "index_confirmations_on_confirmable"
    t.index ["event_slot_id"], name: "index_confirmations_on_event_slot_id"
  end

  create_table "contact_cards", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "full_name"
    t.string "company"
    t.string "city"
    t.string "state"
    t.integer "congressional_district"
    t.string "county"
    t.boolean "is_me", default: false
    t.bigint "organization_id"
    t.bigint "user_id"
    t.date "birthday"
    t.string "birth_date"
    t.integer "birth_year"
    t.string "email_primary"
    t.string "email_secondary"
    t.string "phone_mobile"
    t.string "phone_secondary"
    t.string "signal_username"
    t.string "discord_username"
    t.string "discord_server"
    t.string "url"
    t.string "favorite_movie"
    t.string "favorite_color"
    t.string "favorite_coffee"
    t.string "favorite_cocktail"
    t.boolean "vip", default: false
    t.boolean "politician", default: false
    t.boolean "donor", default: false
    t.boolean "needs_attention", default: false
    t.text "notes"
    t.text "history"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pronoun"
    t.text "ao_notes"
    t.index ["organization_id"], name: "index_contact_cards_on_organization_id"
    t.index ["user_id"], name: "index_contact_cards_on_user_id"
  end

  create_table "event_attendances", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "organization_id"
    t.bigint "user_id"
    t.boolean "status"
    t.string "name"
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_attendances_on_event_id"
    t.index ["organization_id"], name: "index_event_attendances_on_organization_id"
    t.index ["user_id"], name: "index_event_attendances_on_user_id"
  end

  create_table "event_props", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.bigint "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_event_props_on_organization_id"
    t.index ["user_id"], name: "index_event_props_on_user_id"
  end

  create_table "event_slot_types", force: :cascade do |t|
    t.string "name"
    t.integer "default_duration", default: 3
    t.string "default_duration_units", default: "minutes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_slots", force: :cascade do |t|
    t.string "name"
    t.bigint "event_id"
    t.bigint "event_slot_type_id"
    t.bigint "speaker_id"
    t.integer "duration"
    t.time "computed_start_at"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "musician_id"
    t.index ["event_id"], name: "index_event_slots_on_event_id"
    t.index ["event_slot_type_id"], name: "index_event_slots_on_event_slot_type_id"
    t.index ["musician_id"], name: "index_event_slots_on_musician_id"
    t.index ["speaker_id"], name: "index_event_slots_on_speaker_id"
  end

  create_table "event_tasks", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.bigint "event_id"
    t.bigint "user_id"
    t.bigint "team_id"
    t.boolean "done", default: false
    t.string "url"
    t.text "body"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_tasks_on_event_id"
    t.index ["organization_id"], name: "index_event_tasks_on_organization_id"
    t.index ["team_id"], name: "index_event_tasks_on_team_id"
    t.index ["user_id"], name: "index_event_tasks_on_user_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_event_types_on_organization_id"
    t.index ["user_id"], name: "index_event_types_on_user_id"
  end

  create_table "event_volunteers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "pronouns"
    t.string "phone_number"
    t.string "email"
    t.bigint "event_id"
    t.bigint "user_id"
    t.text "how_do_you_want_to_help"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_volunteers_on_event_id"
    t.index ["user_id"], name: "index_event_volunteers_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.bigint "event_type_id"
    t.date "date_start"
    t.date "date_end"
    t.time "time_start"
    t.time "time_end"
    t.string "location"
    t.bigint "share_code_id"
    t.bigint "organization_id"
    t.bigint "user_id"
    t.boolean "has_speakers"
    t.boolean "has_musicians"
    t.boolean "has_props"
    t.boolean "has_partners"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.boolean "active", default: true
    t.time "time_setup"
    t.string "visibility", default: "all"
    t.boolean "show_action_links", default: true
    t.string "fid"
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
    t.index ["fid"], name: "index_events_on_fid"
    t.index ["organization_id"], name: "index_events_on_organization_id"
    t.index ["share_code_id"], name: "index_events_on_share_code_id"
    t.index ["slug"], name: "index_events_on_slug"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "fliers", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.bigint "user_id"
    t.bigint "group_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "due_date"
    t.string "flier_type"
    t.index ["group_id"], name: "index_fliers_on_group_id"
    t.index ["organization_id"], name: "index_fliers_on_organization_id"
    t.index ["project_id"], name: "index_fliers_on_project_id"
    t.index ["user_id"], name: "index_fliers_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_groups_on_organization_id"
  end

  create_table "musicians", force: :cascade do |t|
    t.string "name"
    t.string "band_name"
    t.text "bio"
    t.string "url"
    t.string "pronouns"
    t.integer "play_count"
    t.text "notes"
    t.bigint "user_id"
    t.bigint "contact_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "identifier"
    t.index ["contact_card_id"], name: "index_musicians_on_contact_card_id"
    t.index ["identifier"], name: "index_musicians_on_identifier", unique: true
    t.index ["user_id"], name: "index_musicians_on_user_id"
  end

  create_table "offline_promotion_locations", force: :cascade do |t|
    t.string "name"
    t.bigint "contact_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_card_id"], name: "index_offline_promotion_locations_on_contact_card_id"
  end

  create_table "organization_roles", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.bigint "team_id"
    t.text "job_description"
    t.string "status", default: "Waiting for the Right Person to Sign Up for Glory and Heroism; Text Scott at 317 531 4853 to join the rebellion."
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_organization_roles_on_team_id"
    t.index ["user_id"], name: "index_organization_roles_on_user_id"
  end

  create_table "organization_rules", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "rule_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_organization_rules_on_organization_id"
    t.index ["rule_id"], name: "index_organization_rules_on_rule_id"
  end

  create_table "organization_user_rules", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "user_id"
    t.bigint "rule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_organization_user_rules_on_organization_id"
    t.index ["rule_id"], name: "index_organization_user_rules_on_rule_id"
    t.index ["user_id"], name: "index_organization_user_rules_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "location"
    t.string "organization_type"
    t.string "identifier", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_organizations_on_identifier", unique: true
  end

  create_table "political_actions", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.bigint "organization_id"
    t.bigint "user_id"
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_political_actions_on_organization_id"
    t.index ["user_id"], name: "index_political_actions_on_user_id"
  end

  create_table "poll_options", force: :cascade do |t|
    t.string "name"
    t.bigint "poll_id"
    t.string "widget_type"
    t.string "value"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_poll_options_on_poll_id"
  end

  create_table "poll_responses", force: :cascade do |t|
    t.bigint "poll_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["poll_id"], name: "index_poll_responses_on_poll_id"
  end

  create_table "polls", force: :cascade do |t|
    t.string "name"
    t.bigint "share_code_id"
    t.bigint "user_id"
    t.bigint "organization_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["organization_id"], name: "index_polls_on_organization_id"
    t.index ["share_code_id"], name: "index_polls_on_share_code_id"
    t.index ["slug"], name: "index_polls_on_slug"
    t.index ["user_id"], name: "index_polls_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.bigint "user_id"
    t.bigint "group_id"
    t.string "project_type"
    t.boolean "active", default: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.date "due_date"
    t.string "url"
    t.index ["group_id"], name: "index_projects_on_group_id"
    t.index ["organization_id"], name: "index_projects_on_organization_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "rules", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.bigint "user_id"
    t.bigint "team_id"
    t.boolean "active", default: true
    t.text "body"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "short_name"
    t.index ["organization_id"], name: "index_rules_on_organization_id"
    t.index ["team_id"], name: "index_rules_on_team_id"
    t.index ["user_id"], name: "index_rules_on_user_id"
  end

  create_table "share_codes", force: :cascade do |t|
    t.string "share_code"
    t.bigint "user_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_share_codes_on_organization_id"
    t.index ["share_code"], name: "index_share_codes_on_share_code", unique: true
    t.index ["user_id"], name: "index_share_codes_on_user_id"
  end

  create_table "speakers", force: :cascade do |t|
    t.string "name"
    t.text "bio"
    t.string "url"
    t.string "pronouns"
    t.integer "speaking_count"
    t.text "notes"
    t.bigint "organization_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "identifier"
    t.index ["identifier"], name: "index_speakers_on_identifier", unique: true
    t.index ["organization_id"], name: "index_speakers_on_organization_id"
    t.index ["user_id"], name: "index_speakers_on_user_id"
  end

  create_table "team_rules", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "rule_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rule_id"], name: "index_team_rules_on_rule_id"
    t.index ["team_id"], name: "index_team_rules_on_team_id"
  end

  create_table "team_user_rules", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "user_id"
    t.bigint "rule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "agreed_to", default: false
    t.index ["rule_id"], name: "index_team_user_rules_on_rule_id"
    t.index ["team_id"], name: "index_team_user_rules_on_team_id"
    t.index ["user_id"], name: "index_team_user_rules_on_user_id"
  end

  create_table "team_users", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "user_id"
    t.boolean "active", default: true
    t.boolean "leader", default: false
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "primary_team_role"
    t.string "secondary_team_role"
    t.index ["team_id"], name: "index_team_users_on_team_id"
    t.index ["user_id"], name: "index_team_users_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.bigint "user_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "chat_url"
    t.date "date_expires"
    t.bigint "event_id"
    t.bigint "project_id"
    t.index ["event_id"], name: "index_teams_on_event_id"
    t.index ["organization_id"], name: "index_teams_on_organization_id"
    t.index ["project_id"], name: "index_teams_on_project_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "organization_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "first_name", null: false
    t.string "last_name"
    t.datetime "date_of_birth"
    t.string "role", default: "user", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "key_person", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "vetting_questions", force: :cascade do |t|
    t.text "body"
    t.bigint "organization_id", null: false
    t.bigint "user_id", null: false
    t.bigint "group_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_vetting_questions_on_group_id"
    t.index ["organization_id"], name: "index_vetting_questions_on_organization_id"
    t.index ["user_id"], name: "index_vetting_questions_on_user_id"
  end

  create_table "vetting_transcripts", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.string "chat_type"
    t.string "chat_user"
    t.boolean "active"
    t.text "body"
    t.jsonb "extracted_objects"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_vetting_transcripts_on_group_id"
    t.index ["organization_id"], name: "index_vetting_transcripts_on_organization_id"
    t.index ["user_id"], name: "index_vetting_transcripts_on_user_id"
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.bigint "votable_id"
    t.string "voter_type"
    t.bigint "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "availabilities", "organizations"
  add_foreign_key "availabilities", "users"
  add_foreign_key "bank_deposits", "events"
  add_foreign_key "bank_deposits", "organizations"
  add_foreign_key "bank_deposits", "users"
  add_foreign_key "confirmations", "event_slots"
  add_foreign_key "contact_cards", "organizations"
  add_foreign_key "contact_cards", "users"
  add_foreign_key "event_attendances", "events"
  add_foreign_key "event_attendances", "organizations"
  add_foreign_key "event_attendances", "users"
  add_foreign_key "event_props", "organizations"
  add_foreign_key "event_props", "users"
  add_foreign_key "event_slots", "event_slot_types"
  add_foreign_key "event_slots", "events"
  add_foreign_key "event_slots", "musicians"
  add_foreign_key "event_slots", "speakers"
  add_foreign_key "event_tasks", "events"
  add_foreign_key "event_tasks", "organizations"
  add_foreign_key "event_tasks", "teams"
  add_foreign_key "event_tasks", "users"
  add_foreign_key "event_types", "organizations"
  add_foreign_key "event_types", "users"
  add_foreign_key "event_volunteers", "events"
  add_foreign_key "event_volunteers", "users"
  add_foreign_key "events", "event_types"
  add_foreign_key "events", "organizations"
  add_foreign_key "events", "share_codes"
  add_foreign_key "events", "users"
  add_foreign_key "fliers", "groups"
  add_foreign_key "fliers", "organizations"
  add_foreign_key "fliers", "projects"
  add_foreign_key "fliers", "users"
  add_foreign_key "groups", "organizations"
  add_foreign_key "musicians", "contact_cards"
  add_foreign_key "musicians", "users"
  add_foreign_key "offline_promotion_locations", "contact_cards"
  add_foreign_key "organization_roles", "teams"
  add_foreign_key "organization_roles", "users"
  add_foreign_key "organization_rules", "organizations"
  add_foreign_key "organization_rules", "rules"
  add_foreign_key "organization_user_rules", "organizations"
  add_foreign_key "organization_user_rules", "rules"
  add_foreign_key "organization_user_rules", "users"
  add_foreign_key "political_actions", "organizations"
  add_foreign_key "political_actions", "users"
  add_foreign_key "poll_options", "polls"
  add_foreign_key "poll_responses", "polls"
  add_foreign_key "polls", "organizations"
  add_foreign_key "polls", "share_codes"
  add_foreign_key "polls", "users"
  add_foreign_key "projects", "groups"
  add_foreign_key "projects", "organizations"
  add_foreign_key "projects", "users"
  add_foreign_key "rules", "organizations"
  add_foreign_key "rules", "teams"
  add_foreign_key "rules", "users"
  add_foreign_key "share_codes", "organizations"
  add_foreign_key "share_codes", "users"
  add_foreign_key "speakers", "organizations"
  add_foreign_key "speakers", "users"
  add_foreign_key "team_rules", "rules"
  add_foreign_key "team_rules", "teams"
  add_foreign_key "team_user_rules", "rules"
  add_foreign_key "team_user_rules", "teams"
  add_foreign_key "team_user_rules", "users"
  add_foreign_key "team_users", "teams"
  add_foreign_key "team_users", "users"
  add_foreign_key "teams", "events"
  add_foreign_key "teams", "organizations"
  add_foreign_key "teams", "projects"
  add_foreign_key "teams", "users"
  add_foreign_key "users", "organizations"
  add_foreign_key "vetting_questions", "groups"
  add_foreign_key "vetting_questions", "organizations"
  add_foreign_key "vetting_questions", "users"
  add_foreign_key "vetting_transcripts", "groups"
  add_foreign_key "vetting_transcripts", "organizations"
  add_foreign_key "vetting_transcripts", "users"
end
