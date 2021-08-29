# frozen_string_literal: true

class TestsController < BaseController
  def index
    @pagy, @tests = pagy(Test.order(created_at: :desc))
    @tests = current_user.tests.order(created_at: :desc)
    @users = User.all.except(current_user)
  end

  def create
    test = Tests::Create.call(test_params)

    if test.persisted?
      redirect_to tests_path,
                  flash: { notice: 'Test was successfully created.' }
    else
      redirect_to new_test_path,
                  flash: { error: test.errors.full_messages.to_sentence }
    end
  end

  def destroy
    if Tests::Destroy.call(test)
      redirect_to tests_path
    else
      render status: :forbidden
    end
  end

  private

  def test_params
    params.require(:test).permit(:name, :user_id)
  end

  def test
    @test = Test.find(params[:id])
  end
end
