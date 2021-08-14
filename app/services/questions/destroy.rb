# frozen_string_literal: true

module Questions
  class Destroy
    def initialize(question)
      @question = question
    end

    def call
      @question.destroy
    end
  end
end
