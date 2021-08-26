# frozen_string_literal: true

module Users
  class ProfilesController < BaseController
    before_action :set_users_profile
    before_action :authenticate_user!, except: [:index, :show]

    def show
      # @profile = Users::Profile.find(profile_params)
    end

    def edit
      @profile = Profile.find(params[:id])
    end

    def update
      @users_profile.update(users_profile_params)
      redirect_to root_path
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
