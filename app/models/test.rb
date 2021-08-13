# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :user
  has_many :questions_tests, dependent: :nullify
  has_many :questions, through: :questions_tests
end
