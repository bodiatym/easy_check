class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
