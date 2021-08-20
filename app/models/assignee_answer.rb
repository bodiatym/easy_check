# frozen_string_literal: true

class AssigneeAnswer < ApplicationRecord
  has_many :answer_options_assignee_answers, dependent: :nullify
  has_many :answer_options, through: :answer_options_assignee_answers
  belongs_to :test_assignment
  belongs_to :question
end
