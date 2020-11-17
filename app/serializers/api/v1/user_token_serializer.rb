# frozen_string_literal: true

module Api
  module V1
    class UserTokenSerializer < ActiveModel::Serializer
      attributes :id, :first_name, :last_name, :email, :avatar_url, :token
    end
  end
end
