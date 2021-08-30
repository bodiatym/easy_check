class RemoveQuestionAnswersCount < ActiveRecord::Migration[6.1]
  def change
    remove_column :questions, :answers_count
  end
end
