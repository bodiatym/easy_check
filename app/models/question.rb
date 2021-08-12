# frozen_string_literal: true

class Question < ApplicationRecord
  has_many :answers, dependent: :destroy

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
