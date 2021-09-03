# frozen_string_literal: true

module Tests
  class Update
    def initialize(test, test_params)
      @test = test
      @test_params = test_params
    end

    def call
      @test.update(@test_params)
    end
  end
end
