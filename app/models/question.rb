# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id            :bigint           not null, primary key
#  answer_type   :string           not null
#  answers_count :integer          default(1)
#  body          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint
#
# Indexes
#
#  index_questions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :questions_tests, dependent: :nullify
  has_many :tests, through: :questions_tests
  has_many :assignee_answers, dependent: :destroy
  has_many :answer_options, dependent: :destroy

  belongs_to :user

  accepts_nested_attributes_for :answers, allow_destroy: true

  enum answer_type: {
    single: 'Single-choice',
    multiple: 'Multiple-choice',
    text: 'Text'
  }

  validates :answer_type, presence: true
  validates :body, presence: true
end
