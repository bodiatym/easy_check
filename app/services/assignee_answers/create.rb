# frozen_string_literal: true

module AssigneeAnswers
  class Create
    def initialize(assignee_answer_params)
      @assignee_answer_params = assignee_answer_params
    end

    def call
      AssigneeAnswer.create(@assignee_answer_params)
    end
  end
end
