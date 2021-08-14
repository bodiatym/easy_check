# frozen_string_literal: true

module Questions
  class Update
    def initialize(question, question_params)
      @question = question
      @question_params = question_params
    end

    def call
      @question.update(@question_params)
    end
  end
end
