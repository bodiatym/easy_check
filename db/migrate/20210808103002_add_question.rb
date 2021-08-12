class AddQuestion < ActiveRecord::Migration[6.1]
  def up
    create_table :questions do |t|
      t.string :body, null: false
      t.string :answer_type, null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end

    execute <<-SQL
      CREATE TYPE question_answer_type AS ENUM ('single, multiple, text')
    SQL
  end

  def down
    drop_table :questions

    execute <<-SQL
      DROP TYPE question_answer_type
    SQL
  end
end
