module Questions
  class Update
    def self.call(question, params)
      question.update(params)
    end
  end
end
