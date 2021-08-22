class AddStatusesToTestAssignment < ActiveRecord::Migration[6.1]
  def up
    add_column :test_assignments, :status, :string, default: 'sent'

    execute <<-SQL
      CREATE TYPE test_assignment_status AS ENUM ('sent, in_progress, waiting_for_review, reviewed')
    SQL
  end

  def down
    remove_column :test_assignments, :status, :string

    execute <<-SQL
      DROP TYPE test_assignment_status
    SQL
  end
end
