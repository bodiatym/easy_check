# == Schema Information
#
# Table name: test_assignments
#
#  id              :bigint           not null, primary key
#  assignee_email  :string           not null
#  expiration_time :string           not null
#  test_id         :bigint
#
# Indexes
#
#  index_test_assignments_on_test_id  (test_id)
#
# Foreign Keys
#
#  fk_rails_...  (test_id => tests.id)
#
require 'rails_helper'

RSpec.describe TestAssignment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
