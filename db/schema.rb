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

ActiveRecord::Schema[8.0].define(version: 2025_04_22_083405) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_groups_on_organization_id"
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

  add_foreign_key "groups", "organizations"
  add_foreign_key "users", "organizations"
  add_foreign_key "vetting_questions", "groups"
  add_foreign_key "vetting_questions", "organizations"
  add_foreign_key "vetting_questions", "users"
  add_foreign_key "vetting_transcripts", "groups"
  add_foreign_key "vetting_transcripts", "organizations"
  add_foreign_key "vetting_transcripts", "users"
end
