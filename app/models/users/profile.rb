# frozen_string_literal: true

# == Schema Information
#
# Table name: users_profiles
#
#  id         :bigint           not null, primary key
#  first_name :string           default(""), not null
#  last_name  :string           default(""), not null
#  user_id    :bigint
#
# Indexes
#
#  index_users_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
module Users
  class Profile < ApplicationRecord
    self.table_name_prefix = 'users_'

    belongs_to :user
  end
end
