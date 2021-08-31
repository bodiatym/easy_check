class AddAnswerOptionToAssigneeAnswers < ActiveRecord::Migration[6.1]
  def change
    remove_column :assignee_answers, :answer_option
    add_column :assignee_answers, :answer_option_id, :integer
  end
end
