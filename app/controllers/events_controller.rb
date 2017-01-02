class EventsController < ApplicationController

  def index
    @workshops = Event.where(workshop: true)
    @masterclasses = Event.where(masterclass: true)
  end
  
end
