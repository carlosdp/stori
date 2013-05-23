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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130523170356) do

  create_table "authors", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.boolean  "active"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "email"
  end

  create_table "sentences", :force => true do |t|
    t.integer  "story_id"
    t.integer  "author_id"
    t.string   "content"
    t.integer  "length"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "record_path"
    t.string   "soundcloud_url"
  end

  create_table "stories", :force => true do |t|
    t.integer  "author_id"
    t.string   "title"
    t.date     "publish_date"
    t.date     "complete_date"
    t.boolean  "active"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "soundcloud_url"
  end

end
