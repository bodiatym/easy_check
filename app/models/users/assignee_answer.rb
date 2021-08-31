# frozen_string_literal: true

class TestAssignment < ApplicationRecord
  belongs_to :test_assignment
  belongs_to :question
end
