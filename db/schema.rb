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

ActiveRecord::Schema.define(:version => 20090625170357) do

  create_table "addresses", :force => true do |t|
    t.string   "street",                        :null => false
    t.string   "street_addition"
    t.string   "city",                          :null => false
    t.string   "postcode",        :limit => 15, :null => false
    t.string   "state"
    t.string   "country",                       :null => false
    t.integer  "user_id",                       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "title",      :null => false
    t.text     "content",    :null => false
    t.integer  "user_id",    :null => false
    t.integer  "blog_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", :force => true do |t|
    t.string   "title",         :null => false
    t.integer  "department_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boards", :force => true do |t|
    t.integer  "lecture_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildings", :force => true do |t|
    t.string   "code",            :limit => 3, :null => false
    t.integer  "address_id",                   :null => false
    t.integer  "organization_id",              :null => false
    t.time     "open_from"
    t.time     "open_to"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bullet_activities", :force => true do |t|
    t.integer  "bullet_id",  :null => false
    t.integer  "user_id",    :null => false
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bullet_activities", ["bullet_id"], :name => "index_bullet_activities_on_bullet_id"
  add_index "bullet_activities", ["state"], :name => "index_bullet_activities_on_state"
  add_index "bullet_activities", ["user_id"], :name => "index_bullet_activities_on_user_id"

  create_table "bullets", :force => true do |t|
    t.integer  "board_id",                      :null => false
    t.string   "title",                         :null => false
    t.text     "content",                       :null => false
    t.integer  "user_id",                       :null => false
    t.datetime "replied_at"
    t.boolean  "locked",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bullets", ["board_id", "replied_at"], :name => "index_bullets_on_board_id_and_replied_at"
  add_index "bullets", ["board_id"], :name => "index_bullets_on_board_id"

  create_table "comments", :force => true do |t|
    t.text     "content",    :null => false
    t.integer  "user_id",    :null => false
    t.integer  "article_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "address_id", :null => false
    t.string   "industry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_modules", :force => true do |t|
    t.string   "title",                    :null => false
    t.string   "short",       :limit => 5, :null => false
    t.boolean  "visible"
    t.integer  "level"
    t.text     "description"
    t.integer  "course_id"
    t.integer  "semester",                 :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_modules_lectures", :id => false, :force => true do |t|
    t.integer "lecture_id",       :null => false
    t.integer "course_module_id", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "title",                      :null => false
    t.string   "short",         :limit => 5, :null => false
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_items", :force => true do |t|
    t.integer  "folder_id",                         :null => false
    t.string   "upload_file_name",                  :null => false
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.integer  "user_id",                           :null => false
    t.string   "state",               :limit => 10, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "title",                        :null => false
    t.text     "description"
    t.integer  "organization_id",              :null => false
    t.string   "short",           :limit => 5, :null => false
    t.string   "ldap_ou",                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "lecture_id", :null => false
    t.datetime "due"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.date     "at_date"
    t.time     "at_time"
    t.date     "to_date"
    t.time     "to_time"
    t.integer  "from_block"
    t.integer  "to_block"
    t.string   "repeatFrequency"
    t.integer  "repeatInterval"
    t.integer  "lecture_id"
    t.integer  "room_id"
    t.boolean  "is_blocked",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "folders", :force => true do |t|
    t.integer  "lecture_id"
    t.integer  "parent_id"
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", :force => true do |t|
    t.string   "title",                            :null => false
    t.text     "description"
    t.integer  "position"
    t.integer  "department_id"
    t.boolean  "internal",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lectures", :force => true do |t|
    t.integer  "department_id",              :null => false
    t.string   "title",                      :null => false
    t.string   "short",         :limit => 5, :null => false
    t.text     "description"
    t.boolean  "visible"
    t.boolean  "active"
    t.integer  "credits"
    t.integer  "number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "ldap_dc",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.text     "content",    :null => false
    t.integer  "user_id",    :null => false
    t.integer  "topic_id",   :null => false
    t.integer  "editor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["topic_id", "created_at"], :name => "index_posts_on_topic_id"
  add_index "posts", ["user_id", "created_at"], :name => "index_posts_on_user_id"

  create_table "replies", :force => true do |t|
    t.integer  "bullet_id",  :null => false
    t.text     "content",    :null => false
    t.integer  "user_id",    :null => false
    t.integer  "editor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "replies", ["bullet_id", "created_at"], :name => "index_reply_on_bullet_id"
  add_index "replies", ["user_id", "created_at"], :name => "index_reply_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "title",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "role_id", :null => false
  end

  create_table "rooms", :force => true do |t|
    t.integer  "number",      :null => false
    t.integer  "building_id", :null => false
    t.integer  "user_id",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "forum_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topic_activities", :force => true do |t|
    t.integer  "topic_id",   :null => false
    t.integer  "user_id",    :null => false
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.string   "title",                         :null => false
    t.integer  "forum_id",                      :null => false
    t.integer  "user_id",                       :null => false
    t.boolean  "sticky",     :default => false
    t.datetime "replied_at"
    t.boolean  "locked",     :default => false
    t.integer  "hits",       :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "topics", ["forum_id", "replied_at"], :name => "index_topics_on_forum_id_and_replied_at"
  add_index "topics", ["forum_id", "sticky", "replied_at"], :name => "index_topics_on_sticky_and_replied_at"
  add_index "topics", ["forum_id"], :name => "index_topics_on_forum_id"

  create_table "users", :force => true do |t|
    t.string   "login",               :limit => 50,                    :null => false
    t.string   "name"
    t.string   "surname"
    t.string   "title",               :limit => 15
    t.string   "crypted_password",                                     :null => false
    t.string   "salt"
    t.string   "persistence_token",                                    :null => false
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.datetime "last_request_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "email",                                                :null => false
    t.string   "private_email"
    t.integer  "icq",                 :limit => 15
    t.string   "phone"
    t.text     "activities"
    t.text     "publications"
    t.text     "presentations"
    t.text     "biography"
    t.integer  "company_id"
    t.integer  "department_id"
    t.integer  "address_id"
    t.integer  "home_address_id"
    t.integer  "course_id"
    t.integer  "semester",            :limit => 2
    t.boolean  "active",                            :default => false, :null => false
    t.string   "ldap_dn"
    t.integer  "regid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_seen_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["surname"], :name => "index_users_on_surname"

end
