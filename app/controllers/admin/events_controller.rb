module Admin
  class EventsController < ApplicationController
    before_action :authenticate_admin!
    def new
      @event = Event.new
    end

    def create
      @event = Event.create!(event_params)
      redirect_to events_path
    end

    def edit
      @event = Event.find(params[:id])
    end

    def update
      @event = Event.find(params[:id])
      @event.update(event_params)
      redirect_to events_path
    end

    def delete
    end

    private
    def event_params
      params.require(:event).permit(:name, :details, :date, :time, :address, :url, :workshop, :masterclass, :max_attendees, :max_volunteers, :price_in_pence, :refundable, :image)
    end
  end
end
