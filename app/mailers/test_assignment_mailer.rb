class TestAssignmentMailer < ApplicationMailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'test_assignment_mailer'

  def test_assignment_email(id)
  @test_assignment = TestAssignment.find(id)
  mail(to: @test_assignment.assignee_email, subject: "Here is your test!")
  end

end
