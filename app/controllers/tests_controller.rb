# frozen_string_literal: true

class TestsController < ApplicationController
  def index
    @tests = current_user.tests.reverse
    @users = User.all.except(current_user)
  end

  def create
    test = Tests::Create.call(test_params)

    if test.persisted?
      redirect_to root_path,
                  flash: { notice: 'Test was successfully created.' }
    else
      redirect_to root_path,
                  flash: { error: test.errors.full_messages.to_sentence }
    end
  end

  def destroy
    Tests::Destroy.call(test)
  end

  private

  def test_params
    params.require(:test).permit(:name, :user_id)
  end

  def test
    @test = Test.find(params[:id])
  end
end
