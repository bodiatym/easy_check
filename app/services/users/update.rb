# frozen_string_literal: true

module Users
  class Update
    def initialize(user_profile, users_profile_params)
      @users_profile_params = users_profile_params
      @user_profile = user_profile
    end

    def call
      @user_profile.update(@users_profile_params)
    end
  end
end
