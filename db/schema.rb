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

ActiveRecord::Schema.define(version: 2019_11_14_141632) do

  create_table "addresses", force: :cascade do |t|
    t.integer "number"
    t.string "street"
    t.string "neighborhood"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "arenas", force: :cascade do |t|
    t.string "name"
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_arenas_on_address_id"
  end

  create_table "hours", force: :cascade do |t|
    t.time "time"
    t.decimal "cost"
    t.integer "arena_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arena_id"], name: "index_hours_on_arena_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "form"
    t.boolean "status"
    t.decimal "value"
    t.integer "shedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shedule_id"], name: "index_payments_on_shedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hour_id"], name: "index_schedules_on_hour_id"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end