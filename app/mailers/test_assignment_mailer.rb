# frozen_string_literal: true

class TestAssignmentMailer < ApplicationMailer
  helper :application
  include Devise::Controllers::UrlHelpers
  default template_path: 'test_assignment_mailer'

  def test_assignment_email(id)
    @test_assignment = TestAssignment.find(id)
    attachments['email.jpeg'] = {
      data: File.read(Rails.root.join('app/assets/images/email.jpeg')),
      mime_type: 'image/jpeg'
    }
    mail(to: @test_assignment.assignee_email, subject: "Here is your test from 'Easy Check'!")
  end
end
