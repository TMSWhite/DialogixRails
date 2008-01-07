class ItemUsage < ActiveRecord::Base
  belongs_to :instrument_content, :class_name => 'InstrumentContent', :foreign_key => :instrument_content_id
  belongs_to :instrument_session, :class_name => 'InstrumentSession', :foreign_key => :instrument_session_id
  has_one :null_flavor, :class_name => 'NullFlavor', :foreign_key => :null_flavor_id
  belongs_to :var_name, :class_name => 'VarName', :foreign_key => :var_name_id
  has_one :answer, :class_name => 'Answer', :foreign_key => :answer_id  
  validates_presence_of :ItemUsageSequence
  validates_numericality_of :ItemUsageSequence, :allow_nil => false, :only_integer => true
  validates_numericality_of :GroupNum, :allow_nil => true, :only_integer => true
  validates_presence_of :WhenAsMS
  validates_numericality_of :WhenAsMS, :allow_nil => false, :only_integer => true
  validates_presence_of :DisplayNum
  validates_numericality_of :DisplayNum, :allow_nil => false, :only_integer => true
  validates_numericality_of :itemVisits, :allow_nil => true, :only_integer => true
  validates_numericality_of :responseLatency, :allow_nil => true, :only_integer => true
  validates_length_of :LanguageCode, :allow_nil => true, :maximum => 2
  validates_numericality_of :responseDuration, :allow_nil => true, :only_integer => true
  validates_presence_of :DataElementSequence
  validates_numericality_of :DataElementSequence, :allow_nil => false, :only_integer => true
  
  # The header line lists the attribute names.  ID is quoted to work
  # around an issue with Excel and CSV files that start with "ID".
  def self.csv_header
    "ID,Question,Answer,Language,Time Stamp"
  end

  # Emit our attribute values as a line of CSVs
  def to_csv
    item_usage_id.to_s << "," << self.QuestionAsAsked << "," << self.AnswerString << "," << self.LanguageCode << 
                    "," << self.Time_Stamp.to_s
  end
  
end
