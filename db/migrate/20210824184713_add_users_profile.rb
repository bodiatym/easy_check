class AddUsersProfile < ActiveRecord::Migration[6.1]
  def change
    create_table :users_profiles do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""

      t.references :user, index: true, foreign_key: true
    end
  end
end
