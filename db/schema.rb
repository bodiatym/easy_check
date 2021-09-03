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

ActiveRecord::Schema.define(version: 2021_08_31_111846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_options", force: :cascade do |t|
    t.boolean "correct"
    t.string "body"
    t.bigint "question_id"
    t.index ["question_id"], name: "index_answer_options_on_question_id"
  end

  create_table "answer_options_assignee_answers", force: :cascade do |t|
    t.bigint "assignee_answer_id", null: false
    t.bigint "answer_option_id", null: false
  end

  create_table "answers", force: :cascade do |t|
    t.string "body", null: false
    t.bigint "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "assignee_answers", force: :cascade do |t|
    t.text "body"
    t.integer "value"
    t.bigint "test_assignment_id"
    t.bigint "question_id"
    t.integer "answer_option_id"
    t.index ["question_id"], name: "index_assignee_answers_on_question_id"
    t.index ["test_assignment_id"], name: "index_assignee_answers_on_test_assignment_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "body", null: false
    t.string "answer_type", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "questions_tests", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "test_id", null: false
  end

  create_table "test_assignments", force: :cascade do |t|
    t.string "assignee_email", null: false
    t.string "expiration_time", null: false
    t.bigint "test_id"
    t.string "status", default: "sent"
    t.index ["test_id"], name: "index_test_assignments_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_profiles", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_users_profiles_on_user_id"
  end

  add_foreign_key "answer_options", "questions"
  add_foreign_key "answers", "questions"
  add_foreign_key "assignee_answers", "questions"
  add_foreign_key "assignee_answers", "test_assignments"
  add_foreign_key "questions", "users"
  add_foreign_key "test_assignments", "tests"
  add_foreign_key "tests", "users"
  add_foreign_key "users_profiles", "users"
end
