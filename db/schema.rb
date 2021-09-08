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

ActiveRecord::Schema.define(version: 2021_09_08_114909) do

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

  create_table "clients", force: :cascade do |t|
    t.string "client_name"
    t.text "client_address"
    t.string "client_email"
    t.string "client_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment_text"
    t.bigint "user_id"
    t.bigint "phase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phase_id"], name: "index_comments_on_phase_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "leads", force: :cascade do |t|
    t.string "lead_name"
    t.string "lead_type"
    t.string "platform_used"
    t.boolean "is_sale"
    t.bigint "user_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_leads_on_client_id"
    t.index ["user_id"], name: "index_leads_on_user_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "phase_type"
    t.date "start_date"
    t.date "end_date"
    t.boolean "approved"
    t.bigint "user_id"
    t.bigint "lead_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_phases_on_lead_id"
    t.index ["user_id"], name: "index_phases_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.bigint "lead_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lead_id"], name: "index_projects_on_lead_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "user_email"
    t.integer "user_role"
    t.text "user_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_phases", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "phase_id"
    t.index ["phase_id"], name: "index_users_phases_on_phase_id"
    t.index ["user_id"], name: "index_users_phases_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "phases"
  add_foreign_key "comments", "users"
  add_foreign_key "leads", "clients"
  add_foreign_key "leads", "users"
  add_foreign_key "phases", "leads"
  add_foreign_key "phases", "users"
  add_foreign_key "projects", "leads"
  add_foreign_key "projects", "users"
  add_foreign_key "users_phases", "phases"
  add_foreign_key "users_phases", "users"
end
