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

ActiveRecord::Schema.define(version: 20180314110614) do

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "title"
    t.text     "content"
    t.string   "audio"
    t.index ["room_id"], name: "index_reservations_on_room_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "star",           default: 3
    t.integer  "room_id"
    t.integer  "reservation_id"
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.string   "type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id"
    t.index ["room_id"], name: "index_reviews_on_room_id"
    t.index ["student_id"], name: "index_reviews_on_student_id"
    t.index ["teacher_id"], name: "index_reviews_on_teacher_id"
  end

  create_table "roomphotos", force: :cascade do |t|
    t.integer  "room_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["room_id"], name: "index_roomphotos_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "instrument"
    t.text     "summary"
    t.integer  "teach_years"
    t.integer  "exp_years"
    t.integer  "price"
    t.string   "youtube1"
    t.string   "youtube2"
    t.string   "youtube3"
    t.boolean  "begginer"
    t.boolean  "middle"
    t.boolean  "expert"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "active",        default: false
    t.boolean  "teacher_apply", default: false
    t.boolean  "teacher_auth"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fullname"
    t.string   "sonoligoid"
    t.text     "description"
    t.text     "award"
    t.text     "belong"
    t.string   "twitter"
    t.string   "webpage"
    t.string   "blog"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
