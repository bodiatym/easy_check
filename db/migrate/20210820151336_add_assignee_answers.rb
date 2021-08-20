class AddAssigneeAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :assignee_answers do |t|
      t.integer :answer_option
      t.text :body
      t.integer :value
      t.references :test_assignment, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
    end
  end
end
