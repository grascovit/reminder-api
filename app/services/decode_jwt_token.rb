# frozen_string_literal: true

class DecodeJwtToken
  def initialize(token)
    @token = token
  end

  def execute
    JWT.decode(@token, secret).first&.dig('user_id')
  rescue JWT::DecodeError
    nil
  end

  private

  def secret
    Rails.application.credentials.jwt_secret
  end
end
