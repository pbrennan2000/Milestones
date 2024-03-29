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

ActiveRecord::Schema.define(:version => 20110907003738) do

  create_table "children", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "milestones", :force => true do |t|
    t.string   "name",                             :null => false
    t.text     "description"
    t.string   "file_link"
    t.integer  "posts_to_facebook", :default => 0
    t.integer  "posts_to_twitter",  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "milestone_date"
    t.integer  "child_id",          :default => 0
  end

end
