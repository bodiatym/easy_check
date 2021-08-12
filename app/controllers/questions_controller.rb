# frozen_string_literal: true

class QuestionsController < BaseController
  def new
    @question = Question.new(answers_count: 1)
    @question.assign_attributes(answers_count: params[:answers_count].to_i)
  end

  def create
    Questions::Create.new(question_params, current_user).call

    render :show
  end

  def destroy; end

  private

  def question_params
    params.require(:question).permit(
      :body, :answer_type, :answers_count, answers_attributes: %i[body]
    )
  end
end
