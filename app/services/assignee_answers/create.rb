# frozen_string_literal: true

module AssigneeAnswers
  class Create
    def initialize(assignee_answer_params)
      @assignee_answer_params = assignee_answer_params.to_h.except(:test_assignment_id)
      @init_objects_array = []
      @test_assignment_id = assignee_answer_params.to_h[:test_assignment_id]
    end

    def call
      @assignee_answer_params.each do |key, value|
        values_count = value.size
        build_assignee_answers(values_count, key)
      end

      process_assignee_answers_attributes
    end

    private

    def build_assignee_answers(values_count, key)
      while values_count.positive?
        @init_objects_array << AssigneeAnswer.new(question_id: key)
        values_count -= 1
      end
    end

    def process_assignee_answers_attributes
      @assignee_answer_params.each do |key, value|
        key = key.to_i
        assignee_answers = @init_objects_array.find_all { |obj| obj.question_id == key && obj.answer_option_id.nil? }

        assignee_answers.each do |assignee_answer|
          assign_attributes(assignee_answer, value)

          assignee_answer.save

          assignee_answer.update(
            answer_option_id: answer_options_assignee_answer_id(assignee_answer, value.keys.first.to_i)
          )

          value = value.except(value.keys.first)
        end
      end
    end

    def assign_attributes(assignee_answer, value)
      assignee_answer.assign_attributes(
        value: value.values.first['value'],
        body: value['body'],
        test_assignment_id: @test_assignment_id
      )
    end

    def answer_options_assignee_answer_id(assignee_answer, answer_id)
      AnswerOptionsAssigneeAnswer.create(
        assignee_answer_id: assignee_answer.id,
        answer_option_id: answer_id
      ).id
    end
  end
end
