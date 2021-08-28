# frozen_string_literal: true

module Users
  class ProfilesController < BaseController
    before_action :set_users_profile
    before_action :authenticate_user!

    def update
      Users::Update.new(@users_profile, users_profile_params).call
      render :show
    end

    def edit
      @users_profile = Users::Profile.find_by(user_id: params[:id])
    end

    private

    def set_users_profile
      @users_profile = Users::Profile.find_by(user_id: params[:id])
    end

    def users_profile_params
      params.require(:users_profile).permit(:id, :first_name, :last_name, :user_id)
    end
  end
end
