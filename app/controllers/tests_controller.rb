# frozen_string_literal: true

class TestsController < ApplicationController
  helper_method :test, :test_assignment
  def index

    @pagy, @tests = pagy(current_user.tests.order(created_at: :desc))
    #binding.pry
    #@tests = current_user.tests.order(created_at: :desc)
    #@users = User.all.except(current_user)

  end

  def show; end

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
    Tests::Destroy.new(test).call
    if @test.destroy
      flash[:success] = 'Test successfully deleted.'
    else
      flash[:danger] = 'This test cannot be deleted because it is used in Test Assignment.'
    end
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:name, :user_id, question_ids: [])
  end

  def test
    @test ||= Test.find(params[:id])
  end
end
