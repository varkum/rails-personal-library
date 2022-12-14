# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_08_140654) do
  create_table "articles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.string "author"
    t.text "notes"
    t.string "url"
    t.boolean "consumed"
    t.boolean "starred"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title"
    t.string "author"
    t.text "notes"
    t.boolean "starred"
    t.boolean "consumed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.text "notes"
    t.boolean "starred"
    t.boolean "consumed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "podcasts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "podcast"
    t.string "url"
    t.text "notes"
    t.boolean "consumed"
    t.boolean "starred"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_podcasts_on_user_id"
  end

  create_table "tvshows", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.text "notes"
    t.boolean "consumed"
    t.boolean "starred"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tvshows_on_user_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "author"
    t.string "url"
    t.text "notes"
    t.boolean "consumed"
    t.boolean "starred"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "users"
  add_foreign_key "books", "users"
  add_foreign_key "movies", "users"
  add_foreign_key "podcasts", "users"
  add_foreign_key "tvshows", "users"
  add_foreign_key "tweets", "users"
end
