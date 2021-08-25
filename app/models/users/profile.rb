# frozen_string_literal: true

module Users
  class Profile < ApplicationRecord
    self.table_name = "users_profiles"

    belongs_to :user

    # validates :first_name, presence: true
    # validates :last_name, presence: true
  end
end
