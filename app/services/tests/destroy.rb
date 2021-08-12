module Tests
  class Destroy
    def self.call(test)
      test.delete
    end
  end
end
