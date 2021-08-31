# frozen_string_literal: true

module TestAssignments
  class Create
    def initialize(test_assignment_params)
      @test_assignment_params = test_assignment_params
    end

    def call
      TestAssignment.create!(@test_assignment_params)
    end
  end
end
