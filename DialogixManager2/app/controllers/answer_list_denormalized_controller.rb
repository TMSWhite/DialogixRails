class AnswerListDenormalizedController < ApplicationController
    active_scaffold :answer_list_denormalized do |config|
      config.actions = [:update, :show]
    end
end
