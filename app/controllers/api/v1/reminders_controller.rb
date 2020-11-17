# frozen_string_literal: true

module Api
  module V1
    class RemindersController < ApiController
      before_action :authenticate_user
      before_action :fetch_reminder, only: %i[show update destroy]

      def index
        render json: current_user.reminders, status: :ok, each_serializer: ReminderSerializer
      end

      def show
        render json: @reminder, status: :ok, serializer: ReminderSerializer
      end

      def create
        @reminder = current_user.reminders.create(reminder_params)

        if @reminder.save
          render json: @reminder, status: :created, serializer: ReminderSerializer
        else
          render json: { errors: @reminder.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @reminder.update(reminder_params)
          render json: @reminder, status: :ok, serializer: ReminderSerializer
        else
          render json: { errors: @reminder.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @reminder.destroy

        head :no_content
      end

      private

      def reminder_params
        params.require(:reminder).permit(
          :description,
          :radius,
          :place_type,
          :place,
          :latitude,
          :longitude,
          :last_notified_at
        )
      end

      def fetch_reminder
        @reminder = current_user.reminders.find(params[:id])
      end
    end
  end
end
