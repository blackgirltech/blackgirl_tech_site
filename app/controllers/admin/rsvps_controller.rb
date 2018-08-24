class Admin::RsvpsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @event = Event.find(params[:event_id])
    @rsvps = Rsvp.all.where(event_id: @event.id, attending: true)
  end

  def check_in
    @rsvp = Rsvp.find(params[:id])
    @rsvp.update!(checked_in: true)
    redirect_to admin_event_rsvps_path
  end

  def check_out
    @rsvp = Rsvp.find(params[:id])
    @rsvp.update!(checked_in: false)
    redirect_to admin_event_rsvps_path
  end
end
