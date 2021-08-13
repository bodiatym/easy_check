module Tests
    class Create
      def self.call(params)
        test = Test.new(params)
  
        test.save
  
        test
      end
    end
  end
  