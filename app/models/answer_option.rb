# frozen_string_literal: true

# == Schema Information
#
# Table name: answer_options
#
#  id          :bigint           not null, primary key
#  body        :string
#  correct     :boolean
#  question_id :bigint
#
# Indexes
#
#  index_answer_options_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
class AnswerOption < ApplicationRecord
  has_many :answer_options_assignee_answers, dependent: :nullify
  has_many :assignee_answers, through: :answer_options_assignee_answers
  belongs_to :question
end
