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

ActiveRecord::Schema[7.0].define(version: 2023_04_23_223512) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_services", force: :cascade do |t|
    t.string "title", null: false
    t.integer "price", null: false
    t.integer "price_install", null: false
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_additional_services_on_user_id"
  end

  create_table "cloths", force: :cascade do |t|
    t.string "title", null: false
    t.integer "price", null: false
    t.integer "price_install", null: false
    t.integer "price_corner", null: false
    t.integer "price_install_corner", null: false
    t.boolean "default", default: false, null: false
    t.string "color", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cloths_on_user_id"
  end

  create_table "contours", force: :cascade do |t|
    t.string "title", null: false
    t.integer "price", null: false
    t.integer "price_install", null: false
    t.integer "price_corner", null: false
    t.integer "price_install_corner", null: false
    t.boolean "default", default: false, null: false
    t.string "color", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contours_on_user_id"
  end

  create_table "lusters", force: :cascade do |t|
    t.string "title", null: false
    t.integer "price", null: false
    t.integer "price_install", null: false
    t.string "color", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lusters_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "title"
    t.jsonb "data"
    t.float "linear_mtrs", default: 0.0, null: false
    t.float "square_mtrs", default: 0.0, null: false
    t.bigint "project_id", null: false
    t.bigint "cloth_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cloth_id"], name: "index_rooms_on_cloth_id"
    t.index ["project_id"], name: "index_rooms_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "lastname", null: false
    t.string "name", null: false
    t.string "patronymic", null: false
    t.string "company", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "additional_services", "users"
  add_foreign_key "cloths", "users"
  add_foreign_key "contours", "users"
  add_foreign_key "lusters", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "rooms", "cloths"
  add_foreign_key "rooms", "projects"
end
