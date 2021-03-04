# frozen_string_literal: true

class EncodeJwtToken
  def initialize(user_id)
    @user_id = user_id
  end

  def execute
    JWT.encode(payload, secret)
  end

  private

  def payload
    { user_id: @user_id }
  end

  def secret
    Rails.application.credentials.jwt_secret
  end
end
