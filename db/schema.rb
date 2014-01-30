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

ActiveRecord::Schema.define(version: 20140130090614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "athletes", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.date     "birth"
    t.string   "email"
    t.string   "password"
    t.integer  "state"
    t.integer  "privacy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trainer_id"
  end

  create_table "atrainings", force: true do |t|
    t.text     "comment"
    t.integer  "athlete_id"
    t.integer  "training_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "length"
    t.string   "time"
    t.string   "break"
    t.integer  "sequence"
    t.integer  "atraining_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainers", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.date     "birth"
    t.string   "email"
    t.integer  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
  end

  create_table "trainings", force: true do |t|
    t.date     "date"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trainer_id"
  end

  add_index "trainings", ["trainer_id"], name: "index_trainings_on_trainer_id", using: :btree

end
