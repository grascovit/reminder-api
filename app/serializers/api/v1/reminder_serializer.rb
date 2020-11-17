# frozen_string_literal: true

module Api
  module V1
    class ReminderSerializer < ActiveModel::Serializer
      attributes :id, :description, :radius, :kind, :place_type, :place,
                 :latitude, :longitude, :last_notified_at, :created_at,
                 :updated_at
    end
  end
end
