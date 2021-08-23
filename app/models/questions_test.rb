# frozen_string_literal: true

# == Schema Information
#
# Table name: questions_tests
#
#  id          :bigint           not null, primary key
#  question_id :bigint           not null
#  test_id     :bigint           not null
#
class QuestionsTest < ApplicationRecord
  belongs_to :question
  belongs_to :test
end
