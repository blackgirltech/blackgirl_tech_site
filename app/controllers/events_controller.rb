class EventsController < ApplicationController

  def admin_index
    # authenticate_admin!
    @events = Event.all
  end

  def admin_show
    # authenticate_admin!
    @event = Event.find_by_id(params[:id])
  end

  def new
    # aunthenticate_admin!
    @event = Event.new
  end

  def create
    # aunthenticate_admin!
    @event= Event.create!(event_params)
    redirect_to admin_index_events_path
  end

  def edit
    # aunthenticate_admin!
    @event = Event.find_by_id(params[:id])
  end

  def update
    # aunthenticate_admin!
    @event = Event.find_by_id(params[:id])
    @event.update(event_params)
    redirect_to admin_index_events_path
  end

  def delete
    # aunthenticate_admin!
    @event = Event.find_by_id(params[:id])
    @event.delete
  end

  def index
    @workshops = Event.where(workshop: true).order(date: :asc)
    @masterclasses = Event.where(masterclass: true).order(date: :asc)
    @events = Event.all
  end

  def show
    @event = Event.find_by_id(params[:id])
    @rsvp = @event.rsvps.where(member_id: current_member, event_id: @event.id, attending: true)
    @volunteer = @event.rsvps.where(member_id: current_member, event_id: @event.id, volunteering: true)
  end

  def rsvp
    authenticate_member!
    @event = Event.find_by_id(params[:id])

    # vv this method creates new rsvps for the same user if they unrsvp then rsvp again, at some point we should change this.
    rsvp = Rsvp.find_or_create_by!(
      event_id: @event.id,
      member: current_member,
      donate: params[:event][:rsvps][:donate]
    )

    if rsvp.attending.nil? || !rsvp.attending
      rsvp.update(attending: true)
    end
    payment = EventPayment.new
    payment.pay(current_member, @event, rsvp)
    redirect_to events_path
  end

  def unrsvp
    authenticate_member!
    @event = Event.find_by_id(params[:id])
    rsvp = @event.rsvps.where(member: current_member).where(attending: true)
    rsvp.update(attending: false)
    redirect_to event_path(@event.id)
  end

  def update_rsvp
    @event = Event.find_by_id(params[:id])
    rsvp = @event.rsvps.find_by_id(params[:rsvp_id])
    rsvp.update(rsvp_params)
    respond_to do |format|
      # format.html { redirect_to @event}
      format.js
    end
  end

  def volunteering
    authenticate_member!
    @event = Event.find_by_id(params[:id])
    rsvp = Rsvp.find_or_create_by!(event_id: @event.id, member: current_member)
    if rsvp.volunteering.nil? || !rsvp.volunteering
      rsvp.update(volunteering: true)
    end
    redirect_to "/events/#{@event.id}"
  end

  def unvolunteering
    authenticate_member!
    @event = Event.find_by_id(params[:id])
    rsvp = @event.rsvps.where(member: current_member).where(volunteering: true)
    rsvp.update(volunteering: false)
    redirect_to "/events/#{@event.id}"
  end

  private
  def event_params
    params.permit(:name, :date, :time, :address, :details, :max_attendees, :max_volunteers, :price_in_pence, :refundable, :workshop, :masterclass)
  end

  def rsvp_params
    params.permit(:checked_in)
  end

end
