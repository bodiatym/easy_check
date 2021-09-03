# frozen_string_literal: true

class AnswerOptionsAssigneeAnswersController < ApplicationController

  def create
    AssigneeAnswers::Create.new(assignee_answer_params).call
  end

  private

  def assignee_answer_params
    params.require(:assignee_answer).permit!
  end
end
