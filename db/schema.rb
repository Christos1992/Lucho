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

ActiveRecord::Schema.define(version: 2018_06_26_094808) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "child_medications", force: :cascade do |t|
    t.string "perscriptioned_doses"
    t.boolean "active"
    t.integer "days_for_useage"
    t.bigint "medication_id"
    t.bigint "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_child_medications_on_child_id"
    t.index ["medication_id"], name: "index_child_medications_on_medication_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "type_of_cancer"
    t.integer "stage_of_cancer"
    t.boolean "first_time_patient"
    t.date "date_treatment_begin"
    t.string "hospital_name"
    t.string "doctor_name"
    t.boolean "school"
    t.text "biggest_dream"
    t.text "medications"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "incidents", force: :cascade do |t|
    t.string "medication_name"
    t.string "dose"
    t.string "period"
    t.string "side_effect"
    t.text "description"
    t.integer "metric"
    t.date "date_medication_received"
    t.date "date_of_incident"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_incidents_on_parent_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "working_status"
    t.string "civil_status"
    t.text "hobbies"
    t.boolean "share_info"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_parents_on_user_id"
  end

  create_table "side_effect_incidents", force: :cascade do |t|
    t.bigint "side_effect_id"
    t.bigint "incident_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_side_effect_incidents_on_incident_id"
    t.index ["side_effect_id"], name: "index_side_effect_incidents_on_side_effect_id"
  end

  create_table "side_effects", force: :cascade do |t|
    t.string "name"
    t.string "none"
    t.string "med"
    t.string "modarate"
    t.string "sever"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "child_medications", "children"
  add_foreign_key "child_medications", "medications"
  add_foreign_key "children", "parents"
  add_foreign_key "incidents", "parents"
  add_foreign_key "parents", "users"
  add_foreign_key "side_effect_incidents", "incidents"
  add_foreign_key "side_effect_incidents", "side_effects"
end
