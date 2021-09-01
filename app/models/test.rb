# frozen_string_literal: true

# == Schema Information
#
# Table name: tests
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_tests_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Test < ApplicationRecord
  belongs_to :user
  has_many :test_assignments, dependent: :restrict_with_error
  has_many :questions_tests, dependent: :destroy
  has_many :questions, through: :questions_tests
end
