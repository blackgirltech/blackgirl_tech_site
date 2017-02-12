class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]

  def create
    Event.create!(event_params)
    redirect_to events_path
  rescue ActiveRecord::RecordInvalid => e
    @event = e.record
    render :index
  end

  def new
    @event = Event.new
  end

  def index
    @workshops = Event.where(workshop: true).order(date: :asc)
    @masterclasses = Event.where(masterclass: true).order(date: :asc)
  end
  
  private

  def event_params
    params.require(:event).permit(:name, :details, :image, :address, :workshop, :masterclass, :date, :time, :url)
  end
end
