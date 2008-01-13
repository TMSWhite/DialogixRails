# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "action_types", :primary_key => "action_type_id", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  create_table "answer_list_contents", :primary_key => "answer_list_content_id", :force => true do |t|
    t.string  "answer_code",                  :default => "", :null => false
    t.integer "answer_order",                                 :null => false
    t.integer "answer_list_id", :limit => 20
    t.integer "answer_id",      :limit => 20
  end

  add_index "answer_list_contents", ["answer_id"], :name => "FK_answer_list_contents_answer_id"
  add_index "answer_list_contents", ["answer_list_id"], :name => "FK_answer_list_contents_answer_list_id"

  create_table "answer_list_denormalizeds", :primary_key => "answer_list_denormalized_id", :force => true do |t|
    t.integer "answer_list_denormalized_length",                               :null => false
    t.string  "language_code",                   :limit => 2,  :default => "", :null => false
    t.text    "name",                                          :default => "", :null => false
    t.integer "answer_list_id",                  :limit => 20
  end

  add_index "answer_list_denormalizeds", ["answer_list_id"], :name => "FK_answer_list_denormalizeds_answer_list_id"

  create_table "answer_lists", :primary_key => "answer_list_id", :force => true do |t|
  end

  create_table "answer_localizeds", :primary_key => "answer_localized_id", :force => true do |t|
    t.text    "name"
    t.integer "answer_length",                               :null => false
    t.string  "language_code", :limit => 2,  :default => "", :null => false
    t.integer "answer_id",     :limit => 20
  end

  add_index "answer_localizeds", ["answer_id"], :name => "FK_answer_localizeds_answer_id"

  create_table "answers", :primary_key => "answer_id", :force => true do |t|
    t.boolean "has_la_code", :default => false
    t.string  "la_code"
  end

  create_table "code_systems", :primary_key => "code_system_id", :force => true do |t|
    t.string "name"
    t.string "code_system_oid"
  end

  create_table "data_elements", :primary_key => "data_element_id", :force => true do |t|
    t.text     "comments"
    t.datetime "time_stamp"
    t.integer  "group_num"
    t.integer  "when_as_ms",            :limit => 20, :null => false
    t.text     "question_as_asked"
    t.integer  "display_num",                         :null => false
    t.text     "answer_string"
    t.integer  "item_visits"
    t.integer  "null_flavor_id",                      :null => false
    t.integer  "response_latency"
    t.string   "language_code",         :limit => 2
    t.integer  "response_duration"
    t.integer  "answer_id",             :limit => 20
    t.text     "answer_code"
    t.integer  "data_element_sequence",               :null => false
    t.integer  "instrument_session_id", :limit => 20
    t.integer  "instrument_content_id", :limit => 20
    t.integer  "var_name_id",           :limit => 20
  end

  add_index "data_elements", ["var_name_id"], :name => "FK_data_elements_var_name_id"
  add_index "data_elements", ["instrument_content_id"], :name => "FK_data_elements_instrument_content_id"
  add_index "data_elements", ["instrument_session_id"], :name => "FK_data_elements_instrument_session_id"

  create_table "data_types", :primary_key => "data_type_id", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

  create_table "dialogix_users", :primary_key => "dialogix_user_id", :force => true do |t|
    t.string "first_name", :default => "", :null => false
    t.string "last_name",  :default => "", :null => false
    t.string "user_name",  :default => "", :null => false
    t.string "email",      :default => "", :null => false
    t.string "phone",      :default => "", :null => false
    t.string "pwd",        :default => "", :null => false
  end

  create_table "display_types", :primary_key => "display_type_id", :force => true do |t|
    t.string  "sas_informat",    :default => "",    :null => false
    t.string  "sas_format",      :default => "",    :null => false
    t.string  "name",            :default => "",    :null => false
    t.string  "spss_level",      :default => "",    :null => false
    t.string  "spss_format",     :default => "",    :null => false
    t.string  "loinc_scale",     :default => "",    :null => false
    t.boolean "has_answer_list", :default => false
    t.integer "data_type_id"
  end

  add_index "display_types", ["data_type_id"], :name => "FK_display_types_data_type_id"

  create_table "function_names", :primary_key => "function_name_id", :force => true do |t|
    t.text   "syntax",      :default => "", :null => false
    t.text   "description", :default => "", :null => false
    t.string "name",        :default => "", :null => false
    t.text   "definition",  :default => "", :null => false
  end

  create_table "help_localizeds", :primary_key => "help_localized_id", :force => true do |t|
    t.string  "language_code", :limit => 2,  :default => "", :null => false
    t.text    "name"
    t.integer "help_id",       :limit => 20
  end

  add_index "help_localizeds", ["help_id"], :name => "FK_help_localizeds_help_id"

  create_table "helps", :primary_key => "help_id", :force => true do |t|
  end

  create_table "instrument_contents", :primary_key => "instrument_content_id", :force => true do |t|
    t.text    "default_answer"
    t.string  "spss_format"
    t.text    "concept"
    t.string  "sas_informat"
    t.integer "is_read_only",                                        :null => false
    t.string  "sas_format"
    t.integer "group_num",                                           :null => false
    t.integer "item_sequence",                                       :null => false
    t.string  "item_action_type"
    t.integer "is_required",                                         :null => false
    t.integer "is_message",                                          :null => false
    t.text    "display_name"
    t.text    "format_mask"
    t.text    "relevance",                           :default => "", :null => false
    t.integer "item_id",               :limit => 20
    t.integer "display_type_id"
    t.integer "help_id",               :limit => 20
    t.integer "instrument_version_id", :limit => 20
    t.integer "var_name_id",           :limit => 20
    t.integer "readback_id",           :limit => 20
  end

  add_index "instrument_contents", ["var_name_id"], :name => "FK_instrument_contents_var_name_id"
  add_index "instrument_contents", ["readback_id"], :name => "FK_instrument_contents_readback_id"
  add_index "instrument_contents", ["help_id"], :name => "FK_instrument_contents_help_id"
  add_index "instrument_contents", ["display_type_id"], :name => "FK_instrument_contents_display_type_id"
  add_index "instrument_contents", ["item_id"], :name => "FK_instrument_contents_item_id"
  add_index "instrument_contents", ["instrument_version_id"], :name => "FK_instrument_contents_instrument_version_id"

  create_table "instrument_hashes", :primary_key => "instrument_hash_id", :force => true do |t|
    t.integer "num_equations",                    :null => false
    t.integer "num_questions",                    :null => false
    t.string  "var_list_md5",     :default => "", :null => false
    t.integer "num_branches",                     :null => false
    t.integer "num_languages",                    :null => false
    t.integer "num_tailorings",                   :null => false
    t.integer "num_vars",                         :null => false
    t.integer "num_groups"
    t.integer "num_instructions",                 :null => false
    t.string  "instrument_md5",   :default => "", :null => false
    t.integer "language_list_id"
  end

  add_index "instrument_hashes", ["language_list_id"], :name => "FK_instrument_hashes_language_list_id"

  create_table "instrument_headers", :primary_key => "instrument_header_id", :force => true do |t|
    t.text    "name",                                :default => "", :null => false
    t.integer "instrument_version_id", :limit => 20
    t.integer "reserved_word_id"
  end

  add_index "instrument_headers", ["instrument_version_id"], :name => "FK_instrument_headers_instrument_version_id"
  add_index "instrument_headers", ["reserved_word_id"], :name => "FK_instrument_headers_reserved_word_id"

  create_table "instrument_load_errors", :primary_key => "instrument_load_error_id", :force => true do |t|
    t.integer "source_column"
    t.text    "source_text"
    t.integer "source_row"
    t.integer "log_level"
    t.text    "error_message"
    t.integer "instrument_version_id", :limit => 20
  end

  add_index "instrument_load_errors", ["instrument_version_id"], :name => "FK_instrument_load_errors_instrument_version_id"

  create_table "instrument_sessions", :primary_key => "instrument_session_id", :force => true do |t|
    t.integer  "finished"
    t.integer  "num_vars"
    t.datetime "start_time",                                                 :null => false
    t.integer  "num_groups"
    t.integer  "instrument_starting_group",                                  :null => false
    t.text     "instrument_session_file_name"
    t.integer  "current_var_name",                                           :null => false
    t.string   "ip_address"
    t.string   "language_code",                              :default => "", :null => false
    t.string   "browser"
    t.integer  "max_group"
    t.integer  "current_group",                                              :null => false
    t.integer  "display_num",                                                :null => false
    t.datetime "last_access_time",                                           :null => false
    t.string   "status_msg"
    t.integer  "max_var_num"
    t.integer  "instrument_id",                :limit => 20
    t.integer  "instrument_version_id",        :limit => 20
    t.integer  "dialogix_user_id"
    t.integer  "action_type_id"
  end

  add_index "instrument_sessions", ["dialogix_user_id"], :name => "FK_instrument_sessions_dialogix_user_id"
  add_index "instrument_sessions", ["action_type_id"], :name => "FK_instrument_sessions_action_type_id"
  add_index "instrument_sessions", ["instrument_id"], :name => "FK_instrument_sessions_instrument_id"
  add_index "instrument_sessions", ["instrument_version_id"], :name => "FK_instrument_sessions_instrument_version_id"

  create_table "instrument_versions", :primary_key => "instrument_version_id", :force => true do |t|
    t.string   "loinc_num"
    t.datetime "creation_time_stamp",                                           :null => false
    t.string   "name",                                       :default => "",    :null => false
    t.text     "instrument_version_file_name"
    t.integer  "instrument_status"
    t.boolean  "has_loinc_code",                             :default => false
    t.text     "instrument_notes"
    t.integer  "instrument_id",                :limit => 20
    t.integer  "instrument_hash_id",           :limit => 20
  end

  add_index "instrument_versions", ["instrument_id"], :name => "FK_instrument_versions_instrument_id"
  add_index "instrument_versions", ["instrument_hash_id"], :name => "FK_instrument_versions_instrument_hash_id"

  create_table "instruments", :primary_key => "instrument_id", :force => true do |t|
    t.text   "instrument_description"
    t.string "name",                  :default => "", :null => false
  end

  create_table "item_usages", :primary_key => "item_usage_id", :force => true do |t|
    t.integer  "null_flavor_id",                      :null => false
    t.text     "comments"
    t.integer  "item_usage_sequence",                 :null => false
    t.datetime "time_stamp"
    t.integer  "group_num"
    t.integer  "when_as_ms",            :limit => 20, :null => false
    t.text     "question_as_asked"
    t.integer  "display_num",                         :null => false
    t.text     "answer_string"
    t.integer  "item_visits"
    t.integer  "response_latency"
    t.string   "language_code",         :limit => 2
    t.integer  "response_duration"
    t.integer  "answer_id",             :limit => 20
    t.text     "answer_code"
    t.integer  "data_element_sequence",               :null => false
    t.integer  "instrument_session_id", :limit => 20
    t.integer  "instrument_content_id", :limit => 20
    t.integer  "var_name_id",           :limit => 20
  end

  add_index "item_usages", ["instrument_content_id"], :name => "FK_item_usages_instrument_content_id"
  add_index "item_usages", ["instrument_session_id"], :name => "FK_item_usages_instrument_session_id"
  add_index "item_usages", ["var_name_id"], :name => "FK_item_usages_var_name_id"

  create_table "items", :primary_key => "item_id", :force => true do |t|
    t.string  "item_type",                    :default => "",    :null => false
    t.boolean "has_loinc_code",               :default => false
    t.string  "loinc_num"
    t.integer "question_id",    :limit => 20
    t.integer "answer_list_id", :limit => 20
    t.integer "data_type_id"
    t.integer "validation_id",  :limit => 20
  end

  add_index "items", ["validation_id"], :name => "FK_items_validation_id"
  add_index "items", ["data_type_id"], :name => "FK_items_data_type_id"
  add_index "items", ["question_id"], :name => "FK_items_question_id"
  add_index "items", ["answer_list_id"], :name => "FK_items_answer_list_id"

  create_table "language_lists", :primary_key => "language_list_id", :force => true do |t|
    t.text "name", :default => "", :null => false
  end

  create_table "loinc_instrument_requests", :primary_key => "loinc_instrument_request_id", :force => true do |t|
    t.string  "loinc_system"
    t.string  "loinc_scale"
    t.string  "loinc_property"
    t.string  "loinc_method"
    t.string  "loinc_num"
    t.string  "loinc_time_aspect"
    t.integer "instrument_version_id", :limit => 20
  end

  add_index "loinc_instrument_requests", ["instrument_version_id"], :name => "FK_loinc_instrument_requests_instrument_version_id"

  create_table "loinc_item_requests", :primary_key => "loinc_item_request_id", :force => true do |t|
    t.string  "loinc_system"
    t.string  "loinc_scale"
    t.string  "loinc_property"
    t.string  "loinc_method"
    t.string  "loinc_num"
    t.string  "loinc_time_aspect"
    t.integer "item_id",           :limit => 20
  end

  add_index "loinc_item_requests", ["item_id"], :name => "FK_loinc_item_requests_item_id"

  create_table "null_flavors", :primary_key => "null_flavor_id", :force => true do |t|
    t.string "name",         :default => "", :null => false
    t.string "display_name", :default => "", :null => false
    t.text   "description"
  end

  create_table "page_usage_events", :primary_key => "page_usage_event_id", :force => true do |t|
    t.datetime "time_stamp"
    t.integer  "duration",                                                :null => false
    t.integer  "page_usage_event_sequence",                               :null => false
    t.string   "value1",                                  :default => "", :null => false
    t.string   "event_type",                              :default => "", :null => false
    t.string   "value2",                                  :default => "", :null => false
    t.string   "gui_action_type",                         :default => "", :null => false
    t.string   "var_name",                                :default => "", :null => false
    t.integer  "page_usage_id",             :limit => 20
  end

  add_index "page_usage_events", ["page_usage_id"], :name => "FK_page_usage_events_page_usage_id"

  create_table "page_usages", :primary_key => "page_usage_id", :force => true do |t|
    t.integer  "page_duration"
    t.integer  "server_duration"
    t.integer  "page_usage_sequence",                                 :null => false
    t.integer  "load_duration"
    t.datetime "time_stamp",                                          :null => false
    t.integer  "network_duration"
    t.integer  "to_group_num",                                        :null => false
    t.integer  "page_visits"
    t.string   "status_msg"
    t.integer  "used_jvm_memory",       :limit => 20
    t.string   "ip_address"
    t.integer  "from_group_num",                                      :null => false
    t.string   "browser"
    t.integer  "total_duration"
    t.integer  "display_num",                                         :null => false
    t.string   "language_code",         :limit => 2,  :default => "", :null => false
    t.integer  "instrument_session_id", :limit => 20
    t.integer  "action_type_id"
  end

  add_index "page_usages", ["instrument_session_id"], :name => "FK_page_usages_instrument_session_id"
  add_index "page_usages", ["action_type_id"], :name => "FK_page_usages_action_type_id"

  create_table "question_localizeds", :primary_key => "question_localized_id", :force => true do |t|
    t.string  "language_code",   :limit => 2,  :default => "", :null => false
    t.text    "name"
    t.integer "question_length",                               :null => false
    t.integer "question_id",     :limit => 20
  end

  add_index "question_localizeds", ["question_id"], :name => "FK_question_localizeds_question_id"

  create_table "questions", :primary_key => "question_id", :force => true do |t|
  end

  create_table "readback_localizeds", :primary_key => "readback_localized_id", :force => true do |t|
    t.string  "language_code", :limit => 2,  :default => "", :null => false
    t.text    "name"
    t.integer "readback_id",   :limit => 20
  end

  add_index "readback_localizeds", ["readback_id"], :name => "FK_readback_localizeds_readback_id"

  create_table "readbacks", :primary_key => "readback_id", :force => true do |t|
  end

  create_table "reserved_words", :primary_key => "reserved_word_id", :force => true do |t|
    t.string "name",    :default => "", :null => false
    t.string "meaning"
  end

  create_table "semantic_mapping_as", :primary_key => "semantic_mapping_a_id", :force => true do |t|
    t.text    "code_display_name"
    t.text    "code"
    t.integer "answer_id",         :limit => 20
    t.integer "code_system_id"
  end

  add_index "semantic_mapping_as", ["code_system_id"], :name => "FK_semantic_mapping_as_code_system_id"
  add_index "semantic_mapping_as", ["answer_id"], :name => "FK_semantic_mapping_as_answer_id"

  create_table "semantic_mapping_i_q_as", :primary_key => "semantic_mapping_i_q_a_id", :force => true do |t|
    t.text    "code"
    t.text    "code_display_name"
    t.integer "question_id",           :limit => 20
    t.integer "answer_id",             :limit => 20
    t.integer "code_system_id"
    t.integer "instrument_version_id", :limit => 20
  end

  add_index "semantic_mapping_i_q_as", ["question_id"], :name => "FK_semantic_mapping_i_q_as_question_id"
  add_index "semantic_mapping_i_q_as", ["code_system_id"], :name => "FK_semantic_mapping_i_q_as_code_system_id"
  add_index "semantic_mapping_i_q_as", ["answer_id"], :name => "FK_semantic_mapping_i_q_as_answer_id"
  add_index "semantic_mapping_i_q_as", ["instrument_version_id"], :name => "FK_semantic_mapping_i_q_as_instrument_version_id"

  create_table "semantic_mapping_q_as", :primary_key => "semantic_mapping_q_a_id", :force => true do |t|
    t.text    "code_display_name"
    t.text    "code"
    t.integer "question_id",       :limit => 20
    t.integer "code_system_id"
    t.integer "answer_id",         :limit => 20
  end

  add_index "semantic_mapping_q_as", ["question_id"], :name => "FK_semantic_mapping_q_as_question_id"
  add_index "semantic_mapping_q_as", ["code_system_id"], :name => "FK_semantic_mapping_q_as_code_system_id"
  add_index "semantic_mapping_q_as", ["answer_id"], :name => "FK_semantic_mapping_q_as_answer_id"

  create_table "semantic_mapping_qs", :primary_key => "semantic_mapping_q_id", :force => true do |t|
    t.text    "code_display_name"
    t.text    "code"
    t.integer "question_id",       :limit => 20
    t.integer "code_system_id"
  end

  add_index "semantic_mapping_qs", ["code_system_id"], :name => "FK_semantic_mapping_qs_code_system_id"
  add_index "semantic_mapping_qs", ["question_id"], :name => "FK_semantic_mapping_qs_question_id"

  create_table "sequence", :primary_key => "seq_name", :force => true do |t|
    t.integer "seq_count", :limit => 38, :precision => 38, :scale => 0
  end

  create_table "v1_data_elements", :primary_key => "v1_data_element_id", :force => true do |t|
    t.integer "group_num"
    t.integer "item_visits"
    t.integer "data_element_sequence",                                   :null => false
    t.string  "var_name",                 :limit => 200, :default => "", :null => false
    t.integer "v1_instrument_session_id", :limit => 20
  end

  add_index "v1_data_elements", ["v1_instrument_session_id"], :name => "FK_v1_data_elements_v1_instrument_session_id"
  add_index "v1_data_elements", ["var_name"], :name => "var_name"

  create_table "v1_instrument_sessions", :primary_key => "v1_instrument_session_id", :force => true do |t|
    t.integer  "max_group"
    t.integer  "max_var_num"
    t.string   "instrument_version_name",                   :default => "", :null => false
    t.text     "instrument_version_file_name"
    t.datetime "last_access_time",                                          :null => false
    t.text     "instrument_session_file_name"
    t.integer  "current_group"
    t.integer  "num_vars"
    t.string   "language_code",                :limit => 2
    t.string   "var_list_md5"
    t.string   "status_msg"
    t.integer  "num_groups"
    t.datetime "start_time",                                                :null => false
    t.integer  "finished"
    t.integer  "display_num"
    t.string   "ip_address"
    t.string   "browser"
    t.string   "action_type"
    t.integer  "instrument_starting_group"
  end

  add_index "v1_instrument_sessions", ["language_code"], :name => "language_code"

  create_table "v1_item_usages", :primary_key => "v1_item_usage_id", :force => true do |t|
    t.text     "answer_code0"
    t.text     "answer_string0"
    t.integer  "display_num",                       :null => false
    t.datetime "time_stamp"
    t.text     "question_as_asked"
    t.integer  "when_as_ms",          :limit => 20
    t.text     "answer_string"
    t.integer  "item_visits"
    t.string   "language_code",       :limit => 2
    t.text     "comments"
    t.integer  "item_usage_sequence",               :null => false
    t.text     "comments0"
    t.text     "answer_code"
    t.integer  "v1_data_element_id",  :limit => 20
  end

  add_index "v1_item_usages", ["v1_data_element_id"], :name => "FK_v1_item_usages_v1_data_element_id"
  add_index "v1_item_usages", ["language_code"], :name => "language_code"

  create_table "v1_page_usages", :primary_key => "v1_page_usage_id", :force => true do |t|
    t.integer "server_duration",          :limit => 20
    t.integer "load_duration",            :limit => 20
    t.integer "display_num",                            :null => false
    t.integer "network_duration",         :limit => 20
    t.integer "page_duration",            :limit => 20
    t.string  "language_code",            :limit => 2
    t.integer "total_duration",           :limit => 20
    t.string  "action_type"
    t.integer "v1_instrument_session_id", :limit => 20
  end

  add_index "v1_page_usages", ["v1_instrument_session_id"], :name => "FK_v1_page_usages_v1_instrument_session_id"

  create_table "validations", :primary_key => "validation_id", :force => true do |t|
    t.string  "other_vals"
    t.string  "input_mask"
    t.string  "max_val"
    t.string  "min_val"
    t.integer "data_type_id"
  end

  add_index "validations", ["data_type_id"], :name => "FK_validations_data_type_id"

  create_table "var_names", :primary_key => "var_name_id", :force => true do |t|
    t.string "name", :default => "", :null => false
  end

end
