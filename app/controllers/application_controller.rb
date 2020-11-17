# frozen_string_literal: true

class ApplicationController < ActionController::API
  def authenticate_user
    current_user.present?
  end

  def current_user
    @current_user ||= User.find(user_id)
  rescue ActiveRecord::RecordNotFound
    head :unauthorized
  end

  private

  def user_id
    DecodeJwtToken.new(token).execute
  end

  def token
    @token ||= request.headers['Authorization']&.split(' ')&.last
  end
end
