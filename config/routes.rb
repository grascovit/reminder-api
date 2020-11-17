# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reminders

      namespace :omniauth do
        post :google_oauth2
      end
    end
  end
end
