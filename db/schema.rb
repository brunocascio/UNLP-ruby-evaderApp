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

ActiveRecord::Schema.define(version: 20151209222005) do

  create_table "client_contacts", force: :cascade do |t|
    t.string   "value",      null: false
    t.integer  "client_id",  null: false
    t.integer  "contact_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "client_contacts", ["client_id"], name: "index_client_contacts_on_client_id"
  add_index "client_contacts", ["contact_id"], name: "index_client_contacts_on_contact_id"

  create_table "clients", force: :cascade do |t|
    t.string   "firstname",                        null: false
    t.string   "lastname",                         null: false
    t.string   "cuilt",                 limit: 20, null: false
    t.date     "birthdate",                        null: false
    t.integer  "genre",                            null: false
    t.string   "identification_number", limit: 15, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "clients", ["cuilt"], name: "index_clients_on_cuilt", unique: true

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["name"], name: "index_contacts_on_name", unique: true

end
