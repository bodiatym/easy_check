# frozen_string_literal: true

# == Schema Information
#
# Table name: test_assignments
#
#  id              :bigint           not null, primary key
#  assignee_email  :string           not null
#  expiration_time :string           not null
#  status          :string           default("sent")
#  test_id         :bigint
#
# Indexes
#
#  index_test_assignments_on_test_id  (test_id)
#
# Foreign Keys
#
#  fk_rails_...  (test_id => tests.id)
#
class TestAssignment < ApplicationRecord
  belongs_to :test
  has_many :assignee_answers, dependent: :destroy

  validates :assignee_email, presence: true
  validates :expiration_time, presence: true

  enum status: {
    sent: 'sent',
    in_progress: 'in_progress',
    waiting_for_review: 'waiting_for_review',
    reviewed: 'reviewed'
  }
end
