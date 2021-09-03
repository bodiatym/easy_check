# frozen_string_literal: true

module AssigneeAnswerHelper
  def students_answer(assignee_answer, question)
    if assignee_answer.body.nil?
      if question.answer_type_single?
        single_assignee_answer(assignee_answer)
      elsif question.answer_type_multiple?
        multiple_assignee_answer(assignee_answer)
      end
    else
      assignee_answer.body
    end
  end

  private

  def single_assignee_answer(assignee_answer)
    assignee_answer.answer_options.first.body
  end

  def multiple_assignee_answer(assignee_answer)
    assignee_answer.value == 1 ? assignee_answer.answer_options.first.body : ''
  end
end
