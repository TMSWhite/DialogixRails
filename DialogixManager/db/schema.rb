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

  create_table "action_type", :primary_key => "action_type_id", :force => true do |t|
    t.string "ActionName", :default => "", :null => false
  end

  create_table "answer", :primary_key => "answer_id", :force => true do |t|
    t.boolean "hasLAcode", :default => false
    t.string  "LAcode"
  end

  create_table "answer_list", :primary_key => "answer_list_id", :force => true do |t|
    t.text "Description"
  end

  create_table "answer_list_content", :primary_key => "answer_list_content_id", :force => true do |t|
    t.string  "AnswerCode",                   :default => "", :null => false
    t.integer "AnswerOrder",                                  :null => false
    t.integer "answer_list_id", :limit => 20
    t.integer "answer_id",      :limit => 20
  end

  add_index "answer_list_content", ["answer_id"], :name => "FK_answer_list_content_answer_id"
  add_index "answer_list_content", ["answer_list_id"], :name => "FK_answer_list_content_answer_list_id"

  create_table "answer_list_denormalized", :primary_key => "answer_list_denormalized_id", :force => true do |t|
    t.integer "AnswerListDenormalizedLength",                               :null => false
    t.string  "LanguageCode",                 :limit => 2,  :default => "", :null => false
    t.text    "AnswerListDenormalizedString",               :default => "", :null => false
    t.integer "answer_list_id",               :limit => 20
  end

  add_index "answer_list_denormalized", ["answer_list_id"], :name => "FK_answer_list_denormalized_answer_list_id"

  create_table "answer_localized", :primary_key => "answer_localized_id", :force => true do |t|
    t.text    "AnswerString"
    t.integer "AnswerLength",                               :null => false
    t.string  "LanguageCode", :limit => 2,  :default => "", :null => false
    t.integer "answer_id",    :limit => 20
  end

  add_index "answer_localized", ["answer_id"], :name => "FK_answer_localized_answer_id"

  create_table "code_system", :primary_key => "code_system_id", :force => true do |t|
    t.string "CodeSystemName"
    t.string "CodeSystemOID"
  end

  create_table "data_element", :primary_key => "data_element_id", :force => true do |t|
    t.text     "Comments"
    t.datetime "Time_Stamp"
    t.integer  "GroupNum"
    t.integer  "WhenAsMS",              :limit => 20, :null => false
    t.text     "QuestionAsAsked"
    t.integer  "DisplayNum",                          :null => false
    t.text     "AnswerString"
    t.integer  "itemVisits"
    t.integer  "null_flavor_id",                      :null => false
    t.integer  "responseLatency"
    t.string   "LanguageCode",          :limit => 2
    t.integer  "responseDuration"
    t.integer  "answer_id",             :limit => 20
    t.text     "AnswerCode"
    t.integer  "DataElementSequence",                 :null => false
    t.integer  "instrument_content_id", :limit => 20
    t.integer  "instrument_session_id", :limit => 20
    t.integer  "var_name_id",           :limit => 20
  end

  add_index "data_element", ["instrument_content_id"], :name => "FK_data_element_instrument_content_id"
  add_index "data_element", ["var_name_id"], :name => "FK_data_element_var_name_id"
  add_index "data_element", ["instrument_session_id"], :name => "FK_data_element_instrument_session_id"

  create_table "data_type", :primary_key => "data_type_id", :force => true do |t|
    t.string "DataType", :default => "", :null => false
  end

  create_table "dialogix_user", :primary_key => "dialogix_user_id", :force => true do |t|
    t.string "first_name", :default => "", :null => false
    t.string "last_name",  :default => "", :null => false
    t.string "user_name",  :default => "", :null => false
    t.string "email",      :default => "", :null => false
    t.string "phone",      :default => "", :null => false
    t.string "pwd",        :default => "", :null => false
  end

  create_table "display_type", :primary_key => "display_type_id", :force => true do |t|
    t.string  "SASinformat",   :default => "",    :null => false
    t.string  "SASformat",     :default => "",    :null => false
    t.string  "DisplayType",   :default => "",    :null => false
    t.string  "SPSSlevel",     :default => "",    :null => false
    t.string  "SPSSformat",    :default => "",    :null => false
    t.string  "LOINCscale",    :default => "",    :null => false
    t.boolean "HasAnswerList", :default => false
    t.integer "data_type_id"
  end

  add_index "display_type", ["data_type_id"], :name => "FK_display_type_data_type_id"

  create_table "function_name", :primary_key => "function_name_id", :force => true do |t|
    t.text   "Syntax",      :default => "", :null => false
    t.text   "Description", :default => "", :null => false
    t.string "Name",        :default => "", :null => false
    t.text   "Definition",  :default => "", :null => false
  end

  create_table "help", :primary_key => "help_id", :force => true do |t|
  end

  create_table "help_localized", :primary_key => "help_localized_id", :force => true do |t|
    t.string  "LanguageCode", :limit => 2,  :default => "", :null => false
    t.text    "HelpString"
    t.integer "help_id",      :limit => 20
  end

  add_index "help_localized", ["help_id"], :name => "FK_help_localized_help_id"

  create_table "instrument", :primary_key => "instrument_id", :force => true do |t|
    t.text   "InstrumentDescription"
    t.string "InstrumentName",        :default => "", :null => false
  end

  create_table "instrument_content", :primary_key => "instrument_content_id", :force => true do |t|
    t.text    "DefaultAnswer"
    t.string  "SPSSformat"
    t.text    "Concept"
    t.string  "SASinformat"
    t.integer "isReadOnly",                                          :null => false
    t.string  "SASformat"
    t.integer "GroupNum",                                            :null => false
    t.integer "ItemSequence",                                        :null => false
    t.string  "ItemActionType"
    t.integer "isRequired",                                          :null => false
    t.integer "isMessage",                                           :null => false
    t.text    "DisplayName"
    t.text    "FormatMask"
    t.text    "Relevance",                           :default => "", :null => false
    t.integer "help_id",               :limit => 20
    t.integer "instrument_version_id", :limit => 20
    t.integer "item_id",               :limit => 20
    t.integer "var_name_id",           :limit => 20
    t.integer "display_type_id"
    t.integer "readback_id",           :limit => 20
  end

  add_index "instrument_content", ["var_name_id"], :name => "FK_instrument_content_var_name_id"
  add_index "instrument_content", ["display_type_id"], :name => "FK_instrument_content_display_type_id"
  add_index "instrument_content", ["help_id"], :name => "FK_instrument_content_help_id"
  add_index "instrument_content", ["instrument_version_id"], :name => "FK_instrument_content_instrument_version_id"
  add_index "instrument_content", ["readback_id"], :name => "FK_instrument_content_readback_id"
  add_index "instrument_content", ["item_id"], :name => "FK_instrument_content_item_id"

  create_table "instrument_hash", :primary_key => "instrument_hash_id", :force => true do |t|
    t.integer "NumEquations",                     :null => false
    t.integer "NumQuestions",                     :null => false
    t.string  "VarListMD5",       :default => "", :null => false
    t.integer "NumBranches",                      :null => false
    t.integer "NumLanguages",                     :null => false
    t.integer "NumTailorings",                    :null => false
    t.integer "NumVars",                          :null => false
    t.integer "NumGroups"
    t.integer "NumInstructions",                  :null => false
    t.string  "InstrumentMD5",    :default => "", :null => false
    t.integer "language_list_id"
  end

  add_index "instrument_hash", ["language_list_id"], :name => "FK_instrument_hash_language_list_id"

  create_table "instrument_header", :primary_key => "instrument_header_id", :force => true do |t|
    t.text    "HeaderValue",                         :default => "", :null => false
    t.integer "instrument_version_id", :limit => 20
    t.integer "reserved_word_id"
  end

  add_index "instrument_header", ["reserved_word_id"], :name => "FK_instrument_header_reserved_word_id"
  add_index "instrument_header", ["instrument_version_id"], :name => "FK_instrument_header_instrument_version_id"

  create_table "instrument_load_error", :primary_key => "instrument_load_error_id", :force => true do |t|
    t.integer "sourceColumn"
    t.text    "sourceText"
    t.integer "sourceRow"
    t.integer "logLevel"
    t.text    "ErrorMessage"
    t.integer "instrument_version_id", :limit => 20
  end

  add_index "instrument_load_error", ["instrument_version_id"], :name => "FK_instrument_load_error_instrument_version_id"

  create_table "instrument_session", :primary_key => "instrument_session_id", :force => true do |t|
    t.integer  "Finished"
    t.integer  "NumVars"
    t.datetime "StartTime",                                               :null => false
    t.integer  "NumGroups"
    t.integer  "InstrumentStartingGroup",                                 :null => false
    t.text     "InstrumentSessionFileName"
    t.integer  "CurrentVarNum",                                           :null => false
    t.string   "IPAddress"
    t.string   "LanguageCode",                            :default => "", :null => false
    t.string   "Browser"
    t.integer  "MaxGroup"
    t.integer  "CurrentGroup",                                            :null => false
    t.integer  "DisplayNum",                                              :null => false
    t.datetime "LastAccessTime",                                          :null => false
    t.string   "StatusMsg"
    t.integer  "MaxVarNum"
    t.integer  "action_type_id"
    t.integer  "instrument_version_id",     :limit => 20
    t.integer  "instrument_id",             :limit => 20
    t.integer  "dialogix_user_id"
  end

  add_index "instrument_session", ["instrument_id"], :name => "FK_instrument_session_instrument_id"
  add_index "instrument_session", ["action_type_id"], :name => "FK_instrument_session_action_type_id"
  add_index "instrument_session", ["dialogix_user_id"], :name => "FK_instrument_session_dialogix_user_id"
  add_index "instrument_session", ["instrument_version_id"], :name => "FK_instrument_session_instrument_version_id"

  create_table "instrument_version", :primary_key => "instrument_version_id", :force => true do |t|
    t.string   "LOINC_NUM"
    t.datetime "CreationTimeStamp",                                          :null => false
    t.string   "VersionString",                           :default => "",    :null => false
    t.text     "InstrumentVersionFileName"
    t.integer  "InstrumentStatus"
    t.boolean  "hasLOINCcode",                            :default => false
    t.text     "InstrumentNotes"
    t.integer  "instrument_hash_id",        :limit => 20
    t.integer  "instrument_id",             :limit => 20
  end

  add_index "instrument_version", ["instrument_hash_id"], :name => "FK_instrument_version_instrument_hash_id"
  add_index "instrument_version", ["instrument_id"], :name => "FK_instrument_version_instrument_id"

  create_table "item", :primary_key => "item_id", :force => true do |t|
    t.string  "ItemType",                     :default => "",    :null => false
    t.boolean "hasLOINCcode",                 :default => false
    t.string  "LOINC_NUM"
    t.integer "answer_list_id", :limit => 20
    t.integer "question_id",    :limit => 20
    t.integer "data_type_id"
    t.integer "validation_id",  :limit => 20
  end

  add_index "item", ["question_id"], :name => "FK_item_question_id"
  add_index "item", ["answer_list_id"], :name => "FK_item_answer_list_id"
  add_index "item", ["data_type_id"], :name => "FK_item_data_type_id"
  add_index "item", ["validation_id"], :name => "FK_item_validation_id"

  create_table "item_usage", :primary_key => "item_usage_id", :force => true do |t|
    t.integer  "null_flavor_id",                      :null => false
    t.text     "Comments"
    t.integer  "ItemUsageSequence",                   :null => false
    t.datetime "Time_Stamp"
    t.integer  "GroupNum"
    t.integer  "WhenAsMS",              :limit => 20, :null => false
    t.text     "QuestionAsAsked"
    t.integer  "DisplayNum",                          :null => false
    t.text     "AnswerString"
    t.integer  "itemVisits"
    t.integer  "responseLatency"
    t.string   "LanguageCode",          :limit => 2
    t.integer  "responseDuration"
    t.integer  "answer_id",             :limit => 20
    t.text     "AnswerCode"
    t.integer  "DataElementSequence",                 :null => false
    t.integer  "instrument_content_id", :limit => 20
    t.integer  "var_name_id",           :limit => 20
    t.integer  "instrument_session_id", :limit => 20
  end

  add_index "item_usage", ["var_name_id"], :name => "FK_item_usage_var_name_id"
  add_index "item_usage", ["instrument_content_id"], :name => "FK_item_usage_instrument_content_id"
  add_index "item_usage", ["instrument_session_id"], :name => "FK_item_usage_instrument_session_id"

  create_table "language_list", :primary_key => "language_list_id", :force => true do |t|
    t.text "LanguageList", :default => "", :null => false
  end

  create_table "loinc_instrument_request", :primary_key => "loinc_instrument_request_id", :force => true do |t|
    t.string  "LOINCsystem"
    t.string  "LOINCscale"
    t.string  "LOINCproperty"
    t.string  "LOINCmethod"
    t.string  "LOINC_NUM"
    t.string  "LOINCtimeAspect"
    t.integer "instrument_version_id", :limit => 20
  end

  add_index "loinc_instrument_request", ["instrument_version_id"], :name => "FK_loinc_instrument_request_instrument_version_id"

  create_table "loinc_item_request", :primary_key => "loinc_item_request_id", :force => true do |t|
    t.string  "LOINCsystem"
    t.string  "LOINCscale"
    t.string  "LOINCproperty"
    t.string  "LOINCmethod"
    t.string  "LOINC_NUM"
    t.string  "LOINCtimeAspect"
    t.integer "item_id",         :limit => 20
  end

  add_index "loinc_item_request", ["item_id"], :name => "FK_loinc_item_request_item_id"

  create_table "null_flavor", :primary_key => "null_flavor_id", :force => true do |t|
    t.string "NullFlavor",  :default => "", :null => false
    t.string "DisplayName", :default => "", :null => false
    t.text   "Description"
  end

  create_table "page_usage", :primary_key => "page_usage_id", :force => true do |t|
    t.integer  "pageDuration"
    t.integer  "serverDuration"
    t.string   "LanguageCode",          :limit => 2,  :default => "", :null => false
    t.integer  "loadDuration"
    t.integer  "FromGroupNum",                                        :null => false
    t.integer  "networkDuration"
    t.integer  "DisplayNum",                                          :null => false
    t.integer  "pageVisits"
    t.integer  "totalDuration"
    t.string   "IPAddress"
    t.datetime "Time_Stamp",                                          :null => false
    t.string   "Browser"
    t.string   "StatusMsg"
    t.integer  "ToGroupNum",                                          :null => false
    t.integer  "PageUsageSequence",                                   :null => false
    t.integer  "action_type_id"
    t.integer  "instrument_session_id", :limit => 20
  end

  add_index "page_usage", ["instrument_session_id"], :name => "FK_page_usage_instrument_session_id"
  add_index "page_usage", ["action_type_id"], :name => "FK_page_usage_action_type_id"

  create_table "page_usage_event", :primary_key => "page_usage_event_id", :force => true do |t|
    t.datetime "Time_Stamp"
    t.integer  "duration",                                             :null => false
    t.integer  "PageUsageEventSequence",                               :null => false
    t.string   "value1",                               :default => "", :null => false
    t.string   "eventType",                            :default => "", :null => false
    t.string   "value2",                               :default => "", :null => false
    t.string   "GuiActionType",                        :default => "", :null => false
    t.string   "VarName",                              :default => "", :null => false
    t.integer  "page_usage_id",          :limit => 20
  end

  add_index "page_usage_event", ["page_usage_id"], :name => "FK_page_usage_event_page_usage_id"

  create_table "question", :primary_key => "question_id", :force => true do |t|
  end

  create_table "question_localized", :primary_key => "question_localized_id", :force => true do |t|
    t.string  "LanguageCode",   :limit => 2,  :default => "", :null => false
    t.text    "QuestionString"
    t.integer "questionLength",                               :null => false
    t.integer "question_id",    :limit => 20
  end

  add_index "question_localized", ["question_id"], :name => "FK_question_localized_question_id"

  create_table "readback", :primary_key => "readback_id", :force => true do |t|
  end

  create_table "readback_localized", :primary_key => "readback_localized_id", :force => true do |t|
    t.string  "LanguageCode",   :limit => 2,  :default => "", :null => false
    t.text    "ReadbackString"
    t.integer "readback_id",    :limit => 20
  end

  add_index "readback_localized", ["readback_id"], :name => "FK_readback_localized_readback_id"

  create_table "reserved_word", :primary_key => "reserved_word_id", :force => true do |t|
    t.string "ReservedWord", :default => "", :null => false
    t.string "Meaning"
  end

  create_table "semantic_mapping_a", :primary_key => "semantic_mapping_a_id", :force => true do |t|
    t.text    "CodeDisplayName"
    t.text    "Code"
    t.integer "answer_id",       :limit => 20
    t.integer "code_system_id"
  end

  add_index "semantic_mapping_a", ["answer_id"], :name => "FK_semantic_mapping_a_answer_id"
  add_index "semantic_mapping_a", ["code_system_id"], :name => "FK_semantic_mapping_a_code_system_id"

  create_table "semantic_mapping_i_q_a", :primary_key => "semantic_mapping_i_q_a_id", :force => true do |t|
    t.text    "Code"
    t.text    "CodeDisplayName"
    t.integer "question_id",           :limit => 20
    t.integer "answer_id",             :limit => 20
    t.integer "instrument_version_id", :limit => 20
    t.integer "code_system_id"
  end

  add_index "semantic_mapping_i_q_a", ["code_system_id"], :name => "FK_semantic_mapping_i_q_a_code_system_id"
  add_index "semantic_mapping_i_q_a", ["instrument_version_id"], :name => "FK_semantic_mapping_i_q_a_instrument_version_id"
  add_index "semantic_mapping_i_q_a", ["question_id"], :name => "FK_semantic_mapping_i_q_a_question_id"
  add_index "semantic_mapping_i_q_a", ["answer_id"], :name => "FK_semantic_mapping_i_q_a_answer_id"

  create_table "semantic_mapping_q", :primary_key => "semantic_mapping_q_id", :force => true do |t|
    t.text    "CodeDisplayName"
    t.text    "Code"
    t.integer "question_id",     :limit => 20
    t.integer "code_system_id"
  end

  add_index "semantic_mapping_q", ["question_id"], :name => "FK_semantic_mapping_q_question_id"
  add_index "semantic_mapping_q", ["code_system_id"], :name => "FK_semantic_mapping_q_code_system_id"

  create_table "semantic_mapping_q_a", :primary_key => "semantic_mapping_q_a_id", :force => true do |t|
    t.text    "CodeDisplayName"
    t.text    "Code"
    t.integer "question_id",     :limit => 20
    t.integer "answer_id",       :limit => 20
    t.integer "code_system_id"
  end

  add_index "semantic_mapping_q_a", ["answer_id"], :name => "FK_semantic_mapping_q_a_answer_id"
  add_index "semantic_mapping_q_a", ["code_system_id"], :name => "FK_semantic_mapping_q_a_code_system_id"
  add_index "semantic_mapping_q_a", ["question_id"], :name => "FK_semantic_mapping_q_a_question_id"

  create_table "sequence", :primary_key => "SEQ_NAME", :force => true do |t|
    t.integer "SEQ_COUNT", :limit => 38, :precision => 38, :scale => 0
  end

  create_table "v1_data_element", :primary_key => "v1_data_element_id", :force => true do |t|
    t.datetime "Time_Stamp"
    t.integer  "WhenAsMS",                 :limit => 20,                  :null => false
    t.integer  "DataElementSequence",                                     :null => false
    t.integer  "itemVisits"
    t.integer  "DisplayNum",                                              :null => false
    t.integer  "totalDuration"
    t.text     "QuestionAsAsked"
    t.integer  "pageDuration"
    t.text     "AnswerString"
    t.integer  "serverDuration"
    t.integer  "GroupNum"
    t.integer  "loadDuration"
    t.text     "AnswerCode"
    t.integer  "networkDuration"
    t.string   "LanguageCode",             :limit => 2
    t.text     "Comments"
    t.string   "VarName",                  :limit => 200, :default => "", :null => false
    t.integer  "v1_instrument_session_id", :limit => 20
  end

  add_index "v1_data_element", ["v1_instrument_session_id"], :name => "FK_v1_data_element_v1_instrument_session_id"
  add_index "v1_data_element", ["VarName"], :name => "VarName"
  add_index "v1_data_element", ["LanguageCode"], :name => "LanguageCode"

  create_table "v1_instrument_session", :primary_key => "v1_instrument_session_id", :force => true do |t|
    t.integer  "MaxGroup"
    t.integer  "MaxVarNum"
    t.string   "InstrumentVersionName",                  :default => "", :null => false
    t.text     "InstrumentVersionFileName"
    t.datetime "LastAccessTime",                                         :null => false
    t.text     "InstrumentSessionFileName"
    t.integer  "CurrentGroup"
    t.integer  "NumVars"
    t.string   "LanguageCode",              :limit => 2
    t.string   "VarListMD5"
    t.string   "StatusMsg"
    t.integer  "NumGroups"
    t.datetime "StartTime",                                              :null => false
    t.integer  "Finished"
    t.integer  "DisplayNum"
    t.string   "IPAddress"
    t.string   "Browser"
    t.string   "ActionType"
    t.integer  "InstrumentStartingGroup"
  end

  add_index "v1_instrument_session", ["LanguageCode"], :name => "LanguageCode"

  create_table "v1_item_usage", :primary_key => "v1_item_usage_id", :force => true do |t|
    t.text     "AnswerString"
    t.datetime "Time_Stamp"
    t.integer  "ItemUsageSequence",                                       :null => false
    t.integer  "WhenAsMS",                 :limit => 20
    t.integer  "DataElementSequence",                                     :null => false
    t.integer  "itemVisits"
    t.integer  "DisplayNum",                                              :null => false
    t.integer  "totalDuration"
    t.text     "QuestionAsAsked"
    t.integer  "pageDuration"
    t.integer  "serverDuration"
    t.integer  "GroupNum"
    t.integer  "loadDuration"
    t.text     "AnswerCode"
    t.integer  "networkDuration"
    t.string   "LanguageCode",             :limit => 2
    t.text     "Comments"
    t.string   "VarName",                  :limit => 200, :default => "", :null => false
    t.integer  "v1_instrument_session_id", :limit => 20
  end

  add_index "v1_item_usage", ["v1_instrument_session_id"], :name => "FK_v1_item_usage_v1_instrument_session_id"
  add_index "v1_item_usage", ["VarName"], :name => "VarName"
  add_index "v1_item_usage", ["LanguageCode"], :name => "LanguageCode"

  create_table "validation", :primary_key => "validation_id", :force => true do |t|
    t.string  "OtherVals"
    t.string  "InputMask"
    t.string  "MaxVal"
    t.string  "MinVal"
    t.integer "data_type_id"
  end

  add_index "validation", ["data_type_id"], :name => "FK_validation_data_type_id"

  create_table "var_name", :primary_key => "var_name_id", :force => true do |t|
    t.string "VarName", :default => "", :null => false
  end

end
