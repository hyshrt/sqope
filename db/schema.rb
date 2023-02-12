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

ActiveRecord::Schema.define(version: 2023_02_12_025951) do

  create_table "areas", charset: "utf8mb4", force: :cascade do |t|
    t.string "area_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fields", charset: "utf8mb4", force: :cascade do |t|
    t.string "field_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "funders", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "address_building"
    t.string "tel", null: false
    t.string "url"
    t.string "representative", null: false
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_funders_on_email", unique: true
    t.index ["reset_password_token"], name: "index_funders_on_reset_password_token", unique: true
  end

  create_table "interests", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_interests_on_program_id"
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "program_areas", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.bigint "area_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_program_areas_on_area_id"
    t.index ["program_id"], name: "index_program_areas_on_program_id"
  end

  create_table "program_fields", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.bigint "field_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["field_id"], name: "index_program_fields_on_field_id"
    t.index ["program_id"], name: "index_program_fields_on_program_id"
  end

  create_table "program_targets", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.bigint "target_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_program_targets_on_program_id"
    t.index ["target_id"], name: "index_program_targets_on_target_id"
  end

  create_table "programs", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "funder_id", null: false
    t.string "program_name", null: false
    t.datetime "start_datetime", null: false
    t.datetime "end_datetime", null: false
    t.string "grant_amount", null: false
    t.text "overview", null: false
    t.string "url"
    t.string "determining_time", null: false
    t.string "implementation_period", null: false
    t.string "payment_method", null: false
    t.string "selection_method", null: false
    t.string "use", null: false
    t.string "self_pay", null: false
    t.string "essential_point"
    t.string "program_logo"
    t.string "message"
    t.date "release_date"
    t.date "stop_date"
    t.integer "release_and_status", default: 0, null: false
    t.integer "program_state", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["funder_id"], name: "index_programs_on_funder_id"
  end

  create_table "search_parameter_saves", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "area_id"
    t.bigint "target_id"
    t.bigint "field_id"
    t.string "search_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_search_parameter_saves_on_area_id"
    t.index ["field_id"], name: "index_search_parameter_saves_on_field_id"
    t.index ["target_id"], name: "index_search_parameter_saves_on_target_id"
    t.index ["user_id"], name: "index_search_parameter_saves_on_user_id"
  end

  create_table "targets", charset: "utf8mb4", force: :cascade do |t|
    t.string "group_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "lastname", null: false
    t.string "firstname", null: false
    t.string "lastname_kana", null: false
    t.string "firstname_kana", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "view_histories", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "program_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_view_histories_on_program_id"
    t.index ["user_id"], name: "index_view_histories_on_user_id"
  end

  add_foreign_key "interests", "programs"
  add_foreign_key "interests", "users"
  add_foreign_key "program_areas", "areas"
  add_foreign_key "program_areas", "programs"
  add_foreign_key "program_fields", "fields"
  add_foreign_key "program_fields", "programs"
  add_foreign_key "program_targets", "programs"
  add_foreign_key "program_targets", "targets"
  add_foreign_key "programs", "funders"
  add_foreign_key "search_parameter_saves", "areas"
  add_foreign_key "search_parameter_saves", "fields"
  add_foreign_key "search_parameter_saves", "targets"
  add_foreign_key "search_parameter_saves", "users"
  add_foreign_key "view_histories", "programs"
  add_foreign_key "view_histories", "users"
end
