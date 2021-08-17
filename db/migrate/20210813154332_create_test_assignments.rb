class CreateTestAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :test_assignments do |t|
      t.string :assignee_email
      t.timestamps
    end
  end
end
