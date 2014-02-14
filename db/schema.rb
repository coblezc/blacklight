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

ActiveRecord::Schema.define(version: 20140214190036) do

  create_table "bookmarks", force: true do |t|
    t.integer  "user_id",     null: false
    t.string   "user_type"
    t.string   "document_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", force: true do |t|
    t.text     "query_params"
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "searches", ["user_id"], name: "index_searches_on_user_id"

  create_table "spotlight_attachments", force: true do |t|
    t.string   "name"
    t.string   "file"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spotlight_blacklight_configurations", force: true do |t|
    t.text     "facet_fields"
    t.text     "index_fields"
    t.text     "search_fields"
    t.text     "sort_fields"
    t.text     "default_solr_params"
    t.text     "show"
    t.text     "index"
    t.text     "per_page"
    t.text     "document_index_view_types"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spotlight_custom_fields", force: true do |t|
    t.integer  "exhibit_id"
    t.string   "field"
    t.text     "configuration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spotlight_exhibits", force: true do |t|
    t.string   "name",                        null: false
    t.string   "title",                       null: false
    t.string   "subtitle"
    t.text     "description"
    t.text     "contact_emails"
    t.integer  "blacklight_configuration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spotlight_exhibits", ["name"], name: "index_spotlight_exhibits_on_name", unique: true

  create_table "spotlight_pages", force: true do |t|
    t.string   "title"
    t.string   "type"
    t.text     "content"
    t.integer  "weight",          default: 50
    t.boolean  "published"
    t.integer  "exhibit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_page_id"
    t.boolean  "display_sidebar"
  end

  add_index "spotlight_pages", ["exhibit_id"], name: "index_spotlight_pages_on_exhibit_id"
  add_index "spotlight_pages", ["parent_page_id"], name: "index_spotlight_pages_on_parent_page_id"

  create_table "spotlight_roles", force: true do |t|
    t.integer "exhibit_id"
    t.integer "user_id"
    t.string  "role"
  end

  add_index "spotlight_roles", ["exhibit_id", "user_id"], name: "index_spotlight_roles_on_exhibit_id_and_user_id", unique: true

  create_table "spotlight_searches", force: true do |t|
    t.string   "title"
    t.text     "short_description"
    t.text     "long_description"
    t.text     "query_params"
    t.integer  "weight"
    t.boolean  "on_landing_page"
    t.string   "featured_image"
    t.integer  "exhibit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spotlight_searches", ["exhibit_id"], name: "index_spotlight_searches_on_exhibit_id"

  create_table "spotlight_solr_document_sidecars", force: true do |t|
    t.integer  "exhibit_id"
    t.string   "solr_document_id"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "spotlight_solr_document_sidecars", ["exhibit_id"], name: "index_spotlight_solr_document_sidecars_on_exhibit_id"

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.string   "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "guest",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
