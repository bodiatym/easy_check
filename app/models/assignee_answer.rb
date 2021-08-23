# frozen_string_literal: true

# == Schema Information
#
# Table name: assignee_answers
#
#  id                 :bigint           not null, primary key
#  answer_option      :integer
#  body               :text
#  value              :integer
#  question_id        :bigint
#  test_assignment_id :bigint
#
# Indexes
#
#  index_assignee_answers_on_question_id         (question_id)
#  index_assignee_answers_on_test_assignment_id  (test_assignment_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (test_assignment_id => test_assignments.id)
#
class AssigneeAnswer < ApplicationRecord
  has_many :answer_options_assignee_answers, dependent: :nullify
  has_many :answer_options, through: :answer_options_assignee_answers
  belongs_to :test_assignment
  belongs_to :question
end
