# frozen_string_literal: true

class Reminder < ApplicationRecord
  PLACE_REMINDER = 'place_reminder'
  PLACE_TYPE_REMINDER = 'place_type_reminder'

  belongs_to :user

  validates :description, :radius, presence: true

  def kind
    if place.present? && latitude.present? && longitude.present?
      PLACE_REMINDER
    else
      PLACE_TYPE_REMINDER
    end
  end
end
