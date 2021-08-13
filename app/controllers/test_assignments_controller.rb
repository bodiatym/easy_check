# frozen_string_literal: true

class TestAssignmentsController < BaseController
  helper_method :tests

  def index
    @pagy, @test_assignments = pagy(test_assignments)
  end

  def show
  end

  def new
    @test_assignment = TestAssignment.new
  end

  def create
    test_assignment = TestAssignments::Create.new(test_assignment_params).call
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
    @tests ||= Test.where(user_id: current_user.id).last(20)
  end
end
