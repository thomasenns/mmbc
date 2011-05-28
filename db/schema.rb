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

ActiveRecord::Schema.define(:version => 20110220172338) do

  create_table "governments", :force => true do |t|
    t.string        "name"
    t.string        "type"
    t.boolean       "center"
    t.boolean       "env"
    t.datetime      "created_at"
    t.datetime      "updated_at"
    t.multi_polygon "geom",       :limit => nil, :srid => 4326
  end

  add_index "governments", ["geom"], :name => "index_governments_on_geom"

  create_table "routes", :force => true do |t|
    t.binary      "sections"
    t.binary      "time_lines"
    t.binary      "start_xy"
    t.binary      "finish_xy"
    t.datetime    "created_at"
    t.datetime    "updated_at"
    t.integer     "users_id"
    t.string      "name"
    t.string      "begin_text"
    t.string      "end_text"
    t.line_string "geom",        :limit => nil, :srid => 4326
    t.string      "description"
  end

  add_index "routes", ["geom"], :name => "index_routes_on_geom", :spatial => true

  create_table "sections", :force => true do |t|
    t.boolean     "complete"
    t.string      "side_street"
    t.datetime    "created_at"
    t.datetime    "updated_at"
    t.integer     "routes_id"
    t.integer     "governments_id"
    t.string      "name"
    t.line_string "geom",           :limit => nil, :srid => 4326
    t.string      "distance"
    t.string      "duration"
    t.string      "end_location"
    t.string      "instructions"
    t.string      "start_location"
    t.string      "travel_mode"
    t.string      "direction"
  end

  add_index "sections", ["geom"], :name => "index_sections_on_geom", :spatial => true

  create_table "time_lines", :force => true do |t|
    t.date     "year"
    t.date     "month"
    t.date     "day"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "routes_id"
    t.string   "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
