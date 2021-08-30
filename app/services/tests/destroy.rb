# frozen_string_literal: true

module Tests
  class Destroy
    def initialize(test)
      @test = test
    end

    def call
      @test.delete
    end
  end
end
