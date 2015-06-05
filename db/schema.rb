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

ActiveRecord::Schema.define(version: 20150605202959) do

  create_table "subtask_question_users", force: true do |t|
    t.integer  "subtask_question_id"
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subtask_questions", force: true do |t|
    t.integer  "subtask_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subtask_users", force: true do |t|
    t.integer  "subtask_id"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "answer1"
    t.string   "answer2"
    t.string   "answer3"
    t.string   "answer4"
    t.string   "answer5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subtasks", force: true do |t|
    t.integer  "task_id"
    t.string   "title"
    t.text     "description"
    t.string   "attach1"
    t.string   "attach2"
    t.string   "attach3"
    t.string   "attach4"
    t.string   "attach5"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "duration"
  end

  create_table "task_users", force: true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "is_timed"
  end

  create_table "tasks", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "attach1"
    t.string   "attach2"
    t.string   "attach3"
    t.string   "attach4"
    t.string   "attach5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "mturk_id"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "presurvey_status"
    t.boolean  "timed_survey_status"
    t.boolean  "timed_completion_survey_status"
    t.boolean  "untimed_survey_status"
    t.boolean  "untimed_completion_survey_status"
  end

end
