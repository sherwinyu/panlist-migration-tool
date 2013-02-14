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

ActiveRecord::Schema.define(:version => 20130214053929) do

  create_table "elilists", :force => true do |t|
    t.string   "name"
    t.string   "list_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "list_id"
    t.string   "subscribers_raw"
    t.string   "owners_raw"
  end

  create_table "owners", :force => true do |t|
    t.string   "netid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "owners_panlists", :id => false, :force => true do |t|
    t.integer "owner_id"
    t.integer "panlist_id"
  end

  create_table "panlists", :force => true do |t|
    t.string   "name"
    t.string   "subscribers"
    t.boolean  "public"
    t.boolean  "migrated"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
