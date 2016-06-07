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

ActiveRecord::Schema.define(version: 20160607154247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "situation",       default: 0
    t.integer  "permission",      default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "entity_cadastres", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.string   "cnpj"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "celphone_optional"
    t.string   "email"
    t.string   "email_optional"
    t.integer  "color",              default: 0
    t.string   "cep"
    t.integer  "state_id"
    t.string   "city"
    t.string   "address"
    t.string   "complement"
    t.string   "number"
    t.string   "burgh"
    t.string   "reference_point"
    t.date     "foundation_date"
    t.string   "password_digest"
    t.string   "token"
    t.string   "last_signed_in_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "entity_cadastres", ["state_id"], name: "index_entity_cadastres_on_state_id", using: :btree

  create_table "entity_directories", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.integer  "state_id"
    t.string   "city"
    t.string   "address"
    t.string   "complement"
    t.string   "cep"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "email"
    t.integer  "job"
    t.string   "bio"
    t.date     "mandatory_start"
    t.date     "mandatory_end"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "entity_directories", ["cadastre_id"], name: "index_entity_directories_on_cadastre_id", using: :btree
  add_index "entity_directories", ["state_id"], name: "index_entity_directories_on_state_id", using: :btree

  create_table "entity_lists", force: :cascade do |t|
    t.text     "cadastre_id", default: [],              array: true
    t.string   "name"
    t.string   "description"
    t.integer  "color",       default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "entity_lists", ["cadastre_id"], name: "index_entity_lists_on_cadastre_id", using: :btree

  create_table "entity_members", force: :cascade do |t|
    t.integer  "cadastre_id"
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "cep"
    t.string   "city"
    t.integer  "state_id"
    t.string   "address"
    t.string   "complement"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.string   "celphone"
    t.string   "email"
    t.string   "email_optional"
    t.date     "born"
    t.integer  "born_state_id"
    t.string   "born_city"
    t.string   "cid"
    t.string   "nis"
    t.string   "special_condition_flag"
    t.string   "special_condition"
    t.string   "income"
    t.string   "work_city"
    t.string   "work_state_id"
    t.string   "work_address"
    t.string   "work_complement"
    t.string   "work_telephone"
    t.string   "work_telephone_optional"
    t.integer  "situation",               default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "entity_members", ["cadastre_id"], name: "index_entity_members_on_cadastre_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
