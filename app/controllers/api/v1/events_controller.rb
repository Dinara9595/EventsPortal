module Api
  module V1
    class EventsController < ApplicationController
      def index
        events = Event.where(published: true)

        render json: EventSerializer.new(events)
      end

      def show
        event = Event.find(params[:id])

        render json: EventSerializer.new(event)
      end
    end
  end
end