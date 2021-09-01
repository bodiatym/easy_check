# frozen_string_literal: true

class TestAssignmentsController < BaseController
  helper_method :tests, :test_assignment, :questions

  LIST_LAST_USERS = 20

  def index
    @pagy, @test_assignments = pagy(test_assignments)
  end

  def show; end

  def new
    @test_assignment = TestAssignment.new
  end

  def create
    test_assignment = TestAssignments::Create.new(test_assignment_params).call
    binding.pry
    TestAssignmentMailer.test_assignment_email(test_assignment.id).deliver
  end

  private

  def test_assignment_params
    params.require(:test_assignment).permit(:assignee_email, :expiration_time, :test_id)
  end

  def test_assignments
    TestAssignment.includes(:test)
                  .where(tests: { user_id: current_user.id })
  end

  def tests
    @tests ||= Test.where(user_id: current_user.id).last(LIST_LAST_USERS)
  end

  def test_assignment
    @test_assignment ||= TestAssignment.find(params[:id])
  end

  def questions
    @questions ||= test_assignment.test.questions.includes(:answer_options)
  end
end
