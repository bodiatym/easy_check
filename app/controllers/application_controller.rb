# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  include ErrorHandling

  private

  def user_signed_in?
    current_user.present?
  end

  helper_method :user_signed_in?
end
