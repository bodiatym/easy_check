# frozen_string_literal: true

class TestAssignment < ApplicationRecord
  belongs_to :test

  validates :assignee_email, presence: true
  validates :expiration_time, presence: true
end
