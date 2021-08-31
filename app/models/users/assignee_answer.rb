# frozen_string_literal: true

# == Schema Information
#
# Table name: assignee_answers
#
#  id                 :bigint           not null, primary key
#  body               :text
#  value              :integer
#  answer_option_id   :integer
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
class TestAssignment < ApplicationRecord
  belongs_to :test_assignment
  belongs_to :question
end
