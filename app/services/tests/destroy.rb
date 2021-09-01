# frozen_string_literal: true

module Tests
  class Destroy
    def initialize(test)
      @test = test
    end

    def call
      if @test.test_assignments.any?
        false
      else
        @test.destroy
      end
    end
  end
end
