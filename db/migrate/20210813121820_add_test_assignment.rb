class AddTestAssignment < ActiveRecord::Migration[6.1]
 def change
  create_table :test_assignments do |t|
      t.string :assignee_email, null: false
      t.string :expiration_time, null: false
      t.references :test, index: true, foreign_key: true
    end
  end
end

