module Questions
  class Destroy
    def self.call(question)
      question.delete
    end
  end
end
