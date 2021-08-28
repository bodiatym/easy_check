class AddAnswerOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_options do |t|
      t.boolean :correct
      t.string :body
      t.references :question, index: true, foreign_key: true
    end
  end
end
