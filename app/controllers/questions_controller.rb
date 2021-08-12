# frozen_string_literal: true

class QuestionsController < BaseController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new(answers_count: 1)
    @question.assign_attributes(answers_count: params[:answers_count].to_i)
  end

  def show
   @question = Question.find(params[:id])
  end

  def create
    Questions::Create.new(question_params, current_user).call

    render :show
  end

  def edit
   @question = Question.find(params[:id])
  end

  def update
    Questions::Update.call(question, question_params)
  end

  def destroy
    Questions::Destroy.call(question)
  end


  private

  def question_params
    params.require(:question).permit(
      :body, :answer_type, :answers_count, answers_attributes: %i[body]
    )
  end
end
