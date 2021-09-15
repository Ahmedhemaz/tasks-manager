module API::V1
  class EventsController < ApplicationController
    before_action :set_event, only: %i[show update destroy]

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :start_time, :duration, :recurring)
    end
  end
end
