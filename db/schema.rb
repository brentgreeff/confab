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

ActiveRecord::Schema[8.0].define(version: 2024_10_10_071846) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "changes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "auditable_type", null: false
    t.uuid "auditable_id", null: false
    t.jsonb "json", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auditable_type", "auditable_id"], name: "index_changes_on_auditable"
  end

  create_table "comments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "notifiable_type", null: false
    t.uuid "notifiable_id", null: false
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
  end

  create_table "projects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
