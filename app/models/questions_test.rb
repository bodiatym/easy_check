# frozen_string_literal: true

class QuestionsTest < ApplicationRecord
  belongs_to :question
  belongs_to :test
end
