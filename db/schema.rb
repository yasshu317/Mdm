# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140910133914) do

  create_table "activity_logs", force: true do |t|
    t.string   "activity"
    t.string   "status"
    t.integer  "mobile_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "device_type"
    t.string   "serial_number"
    t.string   "capacity"
    t.integer  "mobile_user_id"
    t.string   "version"
    t.string   "supervised"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imei"
    t.string   "device_model"
  end

  create_table "email_accesses", force: true do |t|
    t.string   "mail_server"
    t.string   "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "group_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id"
  end

  create_table "internal_settings", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mobile_users", force: true do |t|
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.string   "gender"
    t.integer  "employee_id"
    t.string   "mobile"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "registration_id"
  end

  create_table "profile_email_accesses", force: true do |t|
    t.integer "email_access_id"
    t.integer "profile_id"
  end

  create_table "profile_internal_settings", force: true do |t|
    t.integer "internal_setting_id"
    t.integer "profile_id"
  end

  create_table "profiles", force: true do |t|
    t.string   "profile_name"
    t.boolean  "camera"
    t.boolean  "set_password"
    t.integer  "wallpaper_id"
    t.boolean  "call_recording"
    t.boolean  "spy_recording"
    t.integer  "email_access_id"
    t.integer  "default_call_duration"
    t.integer  "device_mode"
    t.integer  "ringtone_id"
    t.boolean  "access_to_os"
    t.boolean  "wifi"
    t.boolean  "gprs"
    t.string   "timezone"
    t.boolean  "secure_pictures"
    t.integer  "internal_setting_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "password_length"
    t.string   "expiry"
    t.string   "password_type"
  end

  create_table "ringtones", force: true do |t|
    t.string   "name"
    t.boolean  "delete_ring_tone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source_file_name"
    t.string   "source_content_type"
    t.integer  "source_file_size"
    t.datetime "source_updated_at"
  end

  create_table "urls", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wallpapers", force: true do |t|
    t.string   "name"
    t.boolean  "delete_wallpaper"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
