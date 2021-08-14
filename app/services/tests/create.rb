# frozen_string_literal: true

module Tests
  class Create
    def self.call(params)
      test = Test.new(params)

      test.save

      test
    end
  end
end
