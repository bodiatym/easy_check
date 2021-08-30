# frozen_string_literal: true
class TestsController < ApplicationController
  def index
  @pagy, @tests = pagy(Test.order(created_at: :desc))
  @tests = current_user.tests.order(created_at: :desc)
  @users = User.all.except(current_user)
  end

  def show
    redirect_to tests_path
  end

  def new
    @test = Test.new
  end

  def create
    if Tests::Create.new(test_params, current_user).call
      redirect_to tests_path
    else
      render :new
    end
  end

  def edit
    test
    @questions = Question.all
  end

  def update
    if Tests::Update.new(test, test_params).call
      redirect_to tests_path
    else
      render :edit
    end
  end

  def destroy
    if Tests::Destroy.new(test).call
      redirect_to tests_path
    else
      render status: :forbidden
    end
  end

  private

  def test_params
    params.require(:test).permit(:name, :user_id, question_ids:[])
  end

  def test
    @test ||= Test.find(params[:id])
  end
end
