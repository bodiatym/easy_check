# frozen_string_literal: true

module Users
  class Profile < ApplicationRecord
    self.table_name_prefix = 'users_'

    belongs_to :user

    #validates_uniqueness_of :user_id
  end
end
