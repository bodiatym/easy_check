# frozen_string_literal: true

class TestAssignment < ApplicationRecord
  belongs_to :test

  validates :assignee_email, presence: true
  validates :expiration_time, presence: true

  enum status: {
    sent: 'sent',
    in_progress: 'in_progress',
    waiting_for_review: 'waiting_for_review',
    reviewed: 'reviewed'
  }
end
