# frozen_string_literal: true

module Tests
  class Create
    def initialize(test_params, current_user)
      @test_params = test_params
      @current_user = current_user
    end

    def call
      @current_user.tests.create(@test_params)
    end
  end
end
