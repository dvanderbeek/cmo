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

ActiveRecord::Schema.define(:version => 20120430214527) do

  create_table "blocks", :force => true do |t|
    t.integer  "col_id"
    t.text     "content"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "blocks", ["col_id"], :name => "index_blocks_on_col_id"

  create_table "cols", :force => true do |t|
    t.integer  "row_id"
    t.integer  "col_width"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cols", ["row_id"], :name => "index_cols_on_row_id"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "layouts", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.integer  "position"
    t.integer  "parent"
    t.text     "content",      :default => ""
    t.string   "seo_title"
    t.text     "seo_meta"
    t.text     "seo_keywords"
    t.integer  "site_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "pages", ["site_id"], :name => "index_pages_on_site_id"

  create_table "rows", :force => true do |t|
    t.integer  "page_id"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rows", ["page_id"], :name => "index_rows_on_page_id"

  create_table "site_resources", :force => true do |t|
    t.string   "name"
    t.integer  "site_id"
    t.string   "resource_type"
    t.integer  "position"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "stylesheet_file_name"
    t.string   "stylesheet_content_type"
    t.integer  "stylesheet_file_size"
    t.datetime "stylesheet_updated_at"
    t.string   "javascript_file_name"
    t.string   "javascript_content_type"
    t.integer  "javascript_file_size"
    t.datetime "javascript_updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "resource_file_name"
    t.string   "resource_content_type"
    t.integer  "resource_file_size"
    t.datetime "resource_updated_at"
    t.string   "resource_url"
  end

  add_index "site_resources", ["site_id"], :name => "index_site_resources_on_site_id"

  create_table "sites", :force => true do |t|
    t.string   "title"
    t.string   "subdomain"
    t.string   "seo_title"
    t.text     "seo_meta"
    t.text     "seo_keywords"
    t.text     "robots"
    t.integer  "user_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "layout_id"
    t.text     "google_analytics"
    t.text     "content"
    t.text     "custom_layout_content"
    t.string   "favicon_file_name"
    t.string   "favicon_content_type"
    t.integer  "favicon_file_size"
    t.datetime "favicon_updated_at"
  end

  add_index "sites", ["user_id"], :name => "index_sites_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
