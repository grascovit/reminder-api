# frozen_string_literal: true

class ApplicationController < ActionController::API
  def authenticate_user
    head :unauthorized and return unless current_user.present?

    response.set_header('Access-Token', current_user.token)
  end

  def current_user
    @current_user ||= User.find(user_id)
  rescue ActiveRecord::RecordNotFound
    head :unauthorized and return
  end

  private

  def user_id
    DecodeJwtToken.new(token).execute
  end

  def token
    @token ||= request.headers['Authorization']&.split(' ')&.last
  end
end
