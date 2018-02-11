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

ActiveRecord::Schema.define(version: 20180211172107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "company"
    t.string "company_number"
    t.string "company_representative"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
    t.integer "user_id"
    t.integer "supplier_id"
    t.integer "order_spec_id"
    t.string "productarea"
    t.string "start_date"
    t.string "end_date"
    t.string "city"
    t.string "percentage"
    t.string "experience"
    t.string "salary"
    t.string "supplier"
    t.string "supplier_price"
    t.string "supplier_name"
    t.string "type_of_service"
  end

  create_table "order_specs", force: :cascade do |t|
    t.string "position"
    t.date "start_date"
    t.date "end_date"
    t.decimal "position_percentage"
    t.string "level_of_experiance"
    t.integer "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade do |t|
    t.string "it"
    t.string "finance"
    t.string "call_center"
    t.string "logisticts"
    t.string "marketing"
    t.string "technology"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supplier_id"
    t.index ["supplier_id"], name: "index_prices_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "company"
    t.string "company_number"
    t.string "company_representative"
    t.string "second_representative"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "recruitment_percentage"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company"
    t.string "company_number"
    t.string "telephone_number"
  end

  add_foreign_key "prices", "suppliers"
end
