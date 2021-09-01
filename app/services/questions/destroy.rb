# frozen_string_literal: true

module Questions
  class Destroy
    def initialize(question)
      @question = question
    end

    def call
      if @question.tests.any?
        false
      else
        @question.destroy
      end
    end
  end
end
