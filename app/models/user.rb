# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  
         after_update :send_password_change_email, if: :needs_password_change_email?

  has_many :questions, dependent: :nullify
  has_many :tests, dependent: :nullify

  def needs_password_change_email?
    encrypted_password_changed? && persisted?
  end
   
  def send_password_change_email
    UserMailer.password_changed(id).deliver
  end

end
