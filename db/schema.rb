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

ActiveRecord::Schema.define(version: 20151216001416) do

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

  create_table "clients_contacts", force: :cascade do |t|
    t.string   "value",      null: false
    t.integer  "client_id",  null: false
    t.integer  "contact_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clients_contacts", ["client_id"], name: "index_clients_contacts_on_client_id"
  add_index "clients_contacts", ["contact_id"], name: "index_clients_contacts_on_contact_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["name"], name: "index_contacts_on_name", unique: true

  create_table "invoices", force: :cascade do |t|
    t.string   "description", null: false
    t.decimal  "amount",      null: false
    t.date     "issue_date",  null: false
    t.integer  "client_id",   null: false
    t.integer  "person_id",   null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id"
  add_index "invoices", ["person_id"], name: "index_invoices_on_person_id"

  create_table "people", force: :cascade do |t|
    t.string   "name",                   null: false
    t.integer  "person_type",            null: false
    t.string   "cuilt",       limit: 20, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "people", ["cuilt"], name: "index_people_on_cuilt", unique: true

end
