class AddIdToAnswerOptionsAssigneeAnswers < ActiveRecord::Migration[6.1]
  def self.up
    add_column :answer_options_assignee_answers, :id, :primary_key
  end

  def self.down
    remove_column :answer_options_assignee_answers, :id
  end
end
