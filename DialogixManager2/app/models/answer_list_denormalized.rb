class AnswerListDenormalized < ActiveRecord::Base
  belongs_to :answer_list, :class_name => 'AnswerList', :foreign_key => :answer_list_id
  has_many :item, :class_name => 'Item', :foreign_key => :answer_list_id
  validates_presence_of :answer_list_denormalized_length
  validates_numericality_of :answer_list_denormalized_length, :allow_nil => false, :only_integer => true
  validates_presence_of :language_code
  validates_length_of :language_code, :allow_nil => false, :maximum => 2
  validates_presence_of :name
  
#  def to_label
#    _name = "<table>"
#    _value = 0
#    "#{name}".split("|") do |token|
#      _value = (_value) ? 0 : 1
#      if (_value)
#        _name << "<tr><td>" << token << "</td>"
#      else
#        _name << "<td>" << token << "</td></tr>"
#      end
#    end
#    _name << "</table>"
#    
#    _name
#  end  
end
