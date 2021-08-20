# frozen_string_literal: true

class AnswerOptionsAssigneeAnswer < ApplicationRecord
  belongs_to :assignee_answer
  belongs_to :answer_option
end
