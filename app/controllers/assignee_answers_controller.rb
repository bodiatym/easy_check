# frozen_string_literal: true

class AssigneeAnswersController < BaseController
  def show
    redirect_to assignee_answers_path
  end

  def index
    assignee_answers
  end

  private

  def test_assignment_params
    params.require(:test_assignment).permit(:assignee_email, :expiration_time, :test_id)
  end

  def test_assignment
    @test_assignment ||= TestAssignment.find(params[:id])
  end

  def assignee_answers
    @assignee_answers ||= test_assignment.assignee_answers
  end
end
