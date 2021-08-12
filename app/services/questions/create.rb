# frozen_string_literal: true

module Questions
  class Create
    def initialize(question_params, current_user)
      @question_params = question_params
      @current_user = current_user
    end

    def call
      @current_user.questions.create(@question_params)
    end
  end
end
