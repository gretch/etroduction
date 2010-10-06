# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 1) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "shortname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.string   "comment",                        :default => ""
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "commentable_id",                 :default => 0,  :null => false
    t.string   "commentable_type", :limit => 15, :default => "", :null => false
    t.integer  "user_id",                        :default => 0,  :null => false
    t.integer  "opportunity_id",                 :default => 0,  :null => false
    t.string   "author_name"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"

  create_table "friendships", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "friend_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["friend_id"], :name => "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], :name => "index_friendships_on_user_id"

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.string   "body"
    t.string   "shortname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "opportunity_id", :default => 0, :null => false
    t.integer  "recepient_id",   :default => 0, :null => false
    t.integer  "sender_id",      :default => 0, :null => false
  end

  create_table "opportunities", :force => true do |t|
    t.text     "details"
    t.string   "job_title"
    t.string   "location"
    t.string   "shortname"
    t.float    "compensation"
    t.string   "category_name"
    t.boolean  "published"
    t.integer  "hits",           :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "comments_count", :default => 0
    t.integer  "category_id",    :default => 0, :null => false
  end

  add_index "opportunities", ["details"], :name => "index_opportunities_on_details"
  add_index "opportunities", ["job_title"], :name => "index_opportunities_on_job_title"
  add_index "opportunities", ["location"], :name => "index_opportunities_on_location"
  add_index "opportunities", ["user_id"], :name => "index_opportunities_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",                                  :null => false
    t.integer  "login_count",                     :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "openid_identifier"
    t.string   "identifier"
    t.string   "name"
    t.string   "email"
    t.string   "location"
    t.text     "expertise"
    t.text     "expertise_duration"
    t.text     "about"
    t.boolean  "admin",                           :default => false
    t.integer  "facebook_uid",       :limit => 8
    t.string   "linkedin_link"
    t.string   "facebook_link"
  end

  add_index "users", ["facebook_uid"], :name => "index_users_on_facebook_uid"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["openid_identifier"], :name => "index_users_on_openid_identifier"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
