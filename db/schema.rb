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

ActiveRecord::Schema[7.0].define(version: 2023_11_04_155624) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "fountain_enum", ["partial", "not_allowed", "allowed"]
  create_enum "locker_room_enum", ["allowed", "closed"]
  create_enum "mask_enum", ["required", "not_required", "recommended"]
  create_enum "towel_enum", ["required", "not_required", "recommended"]

  create_table "schedules", force: :cascade do |t|
    t.string "weekdays"
    t.string "hour"
    t.bigint "unit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_schedules_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.boolean "opened", default: true
    t.enum "mask", default: "required", enum_type: "mask_enum"
    t.enum "towel", default: "required", enum_type: "towel_enum"
    t.enum "fountain", default: "partial", enum_type: "fountain_enum"
    t.enum "locker_room", default: "allowed", enum_type: "locker_room_enum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "schedules", "units"
end
