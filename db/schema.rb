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

ActiveRecord::Schema.define(:version => 20140508161852) do

  create_table "explanations", :force => true do |t|
    t.text     "narrative"
    t.integer  "explainable_id"
    t.string   "explainable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "explanations_sources", :force => true do |t|
    t.integer "explanation_id"
    t.integer "source_id"
  end

  add_index "explanations_sources", ["explanation_id", "source_id"], :name => "index_explanations_sources_on_explanation_id_and_source_id"

  create_table "goals", :force => true do |t|
    t.integer  "number"
    t.string   "title"
    t.integer  "topic_area_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "description"
  end

  add_index "goals", ["topic_area_id"], :name => "index_goals_on_topic_area_id"

  create_table "indicator_groups", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "indicators", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "units"
    t.integer  "number"
    t.integer  "objective_id"
    t.integer  "subject_id"
    t.decimal  "threshhold"
    t.boolean  "higher_value_is_better", :default => true
    t.boolean  "lower_rank_is_better",   :default => true
    t.integer  "indicator_group_id"
  end

  add_index "indicators", ["indicator_group_id"], :name => "index_indicators_on_indicator_group_id"
  add_index "indicators", ["objective_id"], :name => "index_indicators_on_objective_id"
  add_index "indicators", ["subject_id"], :name => "index_indicators_on_subject_id"

  create_table "indicators_issue_areas", :force => true do |t|
    t.integer "indicator_id"
    t.integer "issue_area_id"
  end

  add_index "indicators_issue_areas", ["indicator_id", "issue_area_id"], :name => "index_indicators_issue_areas_on_indicator_id_and_issue_area_id"

  create_table "issue_areas", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "datacommon_url"
    t.integer  "sort_order"
  end

  create_table "objectives", :force => true do |t|
    t.string   "title"
    t.integer  "goal_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "number"
  end

  add_index "objectives", ["goal_id"], :name => "index_objectives_on_goal_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "snapshots", :force => true do |t|
    t.datetime "date"
    t.integer  "value"
    t.integer  "rank"
    t.integer  "indicator_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "snapshots", ["indicator_id"], :name => "index_snapshots_on_indicator_id"

  create_table "sources", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "date"
    t.text     "comment"
    t.string   "author"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "static_pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug_id"
    t.boolean  "top"
    t.integer  "sort_order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "topic_area_id"
  end

  add_index "subjects", ["topic_area_id"], :name => "index_subjects_on_topic_area_id"

  create_table "topic_areas", :force => true do |t|
    t.string   "abbr"
    t.string   "title"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "subtitle"
    t.integer  "explanation_id"
    t.boolean  "visible"
    t.boolean  "featured"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "visualizations", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "explanation_id"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.string   "d3_file_name"
    t.string   "d3_content_type"
    t.integer  "d3_file_size"
    t.datetime "d3_updated_at"
  end

  add_index "visualizations", ["explanation_id"], :name => "index_visualizations_on_explanation_id"

end
