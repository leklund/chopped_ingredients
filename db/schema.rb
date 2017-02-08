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

ActiveRecord::Schema.define(version: 20170208190003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contestants", force: :cascade do |t|
    t.text     "name",       null: false
    t.text     "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_contestants_on_slug", unique: true, using: :btree
  end

  create_table "contestants_shows", id: false, force: :cascade do |t|
    t.integer "contestant_id", null: false
    t.integer "show_id",       null: false
    t.string  "description"
    t.integer "placing"
    t.index ["show_id", "contestant_id"], name: "index_contestants_shows_on_show_id_and_contestant_id", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.text     "name",                       null: false
    t.text     "slug",                       null: false
    t.boolean  "appetizer",  default: false, null: false
    t.boolean  "dessert",    default: false, null: false
    t.boolean  "entree",     default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["slug"], name: "index_ingredients_on_slug", unique: true, using: :btree
  end

  create_table "ingredients_shows", id: false, force: :cascade do |t|
    t.integer "ingredient_id", null: false
    t.integer "show_id",       null: false
    t.string  "round"
    t.index ["show_id", "ingredient_id"], name: "index_ingredients_shows_on_show_id_and_ingredient_id", using: :btree
  end

  create_table "judges", force: :cascade do |t|
    t.text     "name",       null: false
    t.text     "slug",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_judges_on_slug", unique: true, using: :btree
  end

  create_table "judges_shows", id: false, force: :cascade do |t|
    t.integer "judge_id", null: false
    t.integer "show_id",  null: false
    t.index ["show_id", "judge_id"], name: "index_judges_shows_on_show_id_and_judge_id", using: :btree
  end

  create_table "seasons", force: :cascade do |t|
    t.text     "name",       null: false
    t.text     "slug",       null: false
    t.string   "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_seasons_on_slug", unique: true, using: :btree
  end

  create_table "shows", force: :cascade do |t|
    t.text     "title",      null: false
    t.date     "date",       null: false
    t.text     "notes"
    t.text     "slug",       null: false
    t.string   "series_num"
    t.integer  "season_num"
    t.integer  "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_shows_on_slug", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

end
