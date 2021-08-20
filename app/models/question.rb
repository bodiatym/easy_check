# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :questions_tests, dependent: :nullify
  has_many :tests, through: :questions_tests
  has_many :assignee_answers

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
