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

ActiveRecord::Schema.define(version: 20170401181249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "sfw"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "name"
    t.text     "description"
    t.string   "input_type"
    t.hstore   "options"
    t.integer  "parent_id"
    t.string   "genitalia"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_questions_on_category_id", using: :btree
    t.index ["options"], name: "index_questions_on_options", using: :btree
  end

  create_table "surveys", force: :cascade do |t|
    t.string   "token"
    t.string   "category_ids", default: [],              array: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "user_pairs", force: :cascade do |t|
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.integer  "survey_id"
    t.string   "user1_name"
    t.string   "user1_genitals"
    t.string   "user2_name"
    t.string   "user2_genitals"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["survey_id"], name: "index_user_pairs_on_survey_id", using: :btree
    t.index ["user1_id"], name: "index_user_pairs_on_user1_id", using: :btree
    t.index ["user2_id"], name: "index_user_pairs_on_user2_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  add_foreign_key "questions", "categories"
  add_foreign_key "user_pairs", "surveys"
end
