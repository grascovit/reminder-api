# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :email, presence: true

  def self.from_omniauth(params)
    where(provider: params.provider, uid: params.uid).first_or_create do |user|
      user.first_name = params.info.first_name
      user.last_name = params.info.last_name
      user.email = params.info.email
      user.avatar_url = params.info.image
    end
  end

  def token
    EncodeJwtToken.new(id).execute
  end
end
