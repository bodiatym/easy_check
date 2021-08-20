# frozen_string_literal: true

class AnswerOption < ApplicationRecord
  has_many :answer_options_assignee_answers, dependent: :nullify
  has_many :assignee_answers, through: :answer_options_assignee_answers
  belongs_to :question
end
