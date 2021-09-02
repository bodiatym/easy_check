# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'rsceasycheck@gmail.com'

  def password_changed(id)
    @user = User.find(id)
    mail to: @user.email, subject: 'Your password has changed'
  end
end
