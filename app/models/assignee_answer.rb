# frozen_string_literal: true

class AssigneeAnswer < ApplicationRecord
  belongs_to :test_assignment
  belongs_to :question
end
