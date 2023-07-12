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

ActiveRecord::Schema[7.0].define(version: 2023_07_06_162208) do
  create_table "authors", force: :cascade do |t|
    t.string "author_name"
    t.integer "birth_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "author_id", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "downloads"
  end

  create_table "books_readers", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "reader_id", null: false
    t.index ["book_id", "reader_id"], name: "index_books_readers_on_book_id_and_reader_id"
    t.index ["reader_id", "book_id"], name: "index_books_readers_on_reader_id_and_book_id"
  end

  create_table "books_subjects", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "subject_id", null: false
  end

  create_table "readers", force: :cascade do |t|
    t.string "name"
    t.integer "books_read"
    t.integer "books_reading"
    t.integer "books_saved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
