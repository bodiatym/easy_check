# frozen_string_literal: true

# == Schema Information
#
# Table name: answer_options_assignee_answers
#
#  id                 :bigint           not null, primary key
#  answer_option_id   :bigint           not null
#  assignee_answer_id :bigint           not null
#
class AnswerOptionsAssigneeAnswer < ApplicationRecord
  belongs_to :assignee_answer
  belongs_to :answer_option
end
