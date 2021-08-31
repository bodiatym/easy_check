# frozen_string_literal: true

class AnswerOptionsAssigneeAnswersController < ApplicationController

  def create
    assignee_answer = AssigneeAnswers::Create.new(assignee_answer_params).call
  end

  private 

  def assignee_answer_params
    params.require(:assignee_answer).permit(:body, :value, :test_assignment_id, :question_id, :answer_option_id)
  end
end
