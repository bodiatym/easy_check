class CreateJoinTableAssigneeAnswersAnswerOptions < ActiveRecord::Migration[6.1]
  def change
    create_join_table :assignee_answers, :answer_options do |t|
    end
  end
end
