class AddIdToQuestionsTests < ActiveRecord::Migration[6.1]
  def self.up
    add_column :questions_tests, :id, :primary_key
  end

  def self.down
    remove_column :questions_tests, :id
  end
end
