module V1
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user_from_token!

    # POST /v1/login
    def create
      full_access_token = [params[:uuid],params[:access_token]].join(':')
      @user = User.where({uuid: params[:uuid], access_token: full_access_token}).take

      return invalid_login_attempt unless @user
      if @user
        sign_in :user, @user
        # Implicit namespaced to V1::SessionSerializer
        auth = @user.authentications.find_by_provider('facebook')
        profile = FacebookProfile.find_by_authentication_id(auth.id)

        render json: @user, facebook_profile: profile, serializer: SessionSerializer, root: nil
      else
        invalid_login_attempt
      end
    end

    private

    def invalid_login_attempt
      warden.custom_failure!
      render json: {error: t('sessions_controller.invalid_login_attempt')}, status: :unprocessable_entity
    end
  end
end
