class QuestionLocalizedController < ApplicationController
  active_scaffold :question_localized do |config|  
    
    def conditions_in_collection
      ['language_code in (?)', ['en']]
    end
  end
end
