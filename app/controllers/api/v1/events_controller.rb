module API::V1
  class EventsController < ApplicationController
    before_action :set_event, only: %i[show update destroy]

    # GET /events
    def index
      # cach views with redis
      @events = Event.with_task_full_data
      @events = @events.flat_map { |e| e.calendar_events(params.fetch(:start_date, Time.zone.now).to_date) }
      @events
    end

    # POST /events
    def create
      @event = Event.new(event_params)
      if @event.save
        render json: @event, status: :created
      else
        render json: @event.errors, status: :unprocessable_entity
      end
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :start_time, :duration, :recurring, :task_id)
    end
  end
end
