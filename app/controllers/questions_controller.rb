# frozen_string_literal: true

class QuestionsController < BaseController
  before_action :question, only: %i[show edit]

  def index
    @pagy, @questions = pagy Question.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def show; end

  def create
    if Questions::Create.new(question_params, current_user).call
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    render :new
  end

  def update
    if Questions::Update.new(question, question_params).call
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    if Questions::Destroy.new(question).call
      redirect_to questions_path
    else
      render status: :forbidden
    end
  end

  private

  def question_params
    params.require(:question).permit(
      :body, :answer_type, answers_attributes: %i[body]
    )
  end

  def question
    @question ||= Question.find(params[:id])
  end
end
