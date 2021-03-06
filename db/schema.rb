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

ActiveRecord::Schema.define(version: 2019_08_04_030340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.decimal "lat", precision: 15, scale: 10
    t.decimal "lng", precision: 15, scale: 10
    t.string "photo"
    t.text "description"
    t.bigint "user_id"
    t.bigint "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_complaints_on_user_id"
    t.index ["work_id"], name: "index_complaints_on_work_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "promo_code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promo_code_id"], name: "index_exchanges_on_promo_code_id"
    t.index ["user_id"], name: "index_exchanges_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
    t.index ["work_id"], name: "index_favorites_on_work_id"
  end

  create_table "promo_codes", force: :cascade do |t|
    t.string "company_name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "required_points", default: 1
    t.string "formatted_value"
    t.string "company_logo"
    t.text "description"
    t.integer "quantity"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "authentication_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score", default: 0
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "lat"
    t.string "lng"
    t.integer "idn_empreendimento"
    t.date "data_conclusao"
    t.date "data_selecao"
    t.string "estagio"
    t.string "execucao_fisica"
    t.string "obra_nome"
    t.bigint "city_id"
    t.bigint "work_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "investment"
    t.string "image_url"
    t.string "executor"
    t.string "orgao_responsavel"
    t.index ["city_id"], name: "index_works_on_city_id"
    t.index ["work_type_id"], name: "index_works_on_work_type_id"
  end

end
