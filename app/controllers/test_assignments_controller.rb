# frozen_string_literal: true

class TestAssignmentsController < BaseController
  helper_method :tests

  def new
    @test_assignment = TestAssignment.new
  end

  def create
    TestAssignments::Create.new(test_assignment_params).call
  end

  private

  def test_assignment_params
    params.require(:test_assignment).permit(:assignee_email, :expiration_time, :test_id)
  end

  def tests
    @tests ||= Test.where(user_id: current_user.id).last(20)
  end
end
