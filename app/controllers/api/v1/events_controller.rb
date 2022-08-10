module Api
  module V1
    class EventsController < ApplicationController
      def index
        render json: EventSerializer.new(events)
      end

      def show
        event = Event.find(params[:id])

        render json: EventSerializer.new(event)
      end

      private

      def events
        events_published = Event.where(published: true)
        start_date = params[:start_date]
        end_date = params[:end_date]

        events_published = events_published.where(created_at: start_date..end_date) if start_date && end_date

        events_published
      end
    end
  end
end
