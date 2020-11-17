# frozen_string_literal: true

module Api
  module V1
    class OmniauthController < ApiController
      GOOGLE_OAUTH2_PROVIDER = 'google_oauth2'

      serialization_scope :view_context

      def google_oauth2
        @user = User.from_omniauth(omniauth_hash)

        if @user.persisted?
          render json: @user, status: :ok, serializer: UserTokenSerializer
        else
          render json: @user.errors.full_messages, status: :unprocessable_entity
        end
      end

      private

      def google_oauth2_params
        params.require(:omniauth).permit(:id_token)
      end

      def omniauth_hash
        @omniauth_hash ||= OmniAuth::AuthHash.new(
          uid: id_token['sub'],
          provider: GOOGLE_OAUTH2_PROVIDER,
          info: {
            email: id_token['email'],
            first_name: id_token['given_name'],
            last_name: id_token['family_name'],
            image: id_token['picture']
          }
        )
      end

      def id_token
        @id_token ||= JWT.decode(google_oauth2_params['id_token'], nil, false).first
      rescue JWT::DecodeError
        head :bad_request
      end
    end
  end
end
