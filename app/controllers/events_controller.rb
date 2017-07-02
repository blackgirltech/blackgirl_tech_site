class EventsController < ApplicationController

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
    rsvp = Rsvp.find_or_create_by!(
      event_id: @event.id,
      member: current_member,
      stripe_token: params[:stripe_token],
      refund: params[:event][:rsvps][:refund]
    )
    if rsvp.attending.nil? || !rsvp.attending
      rsvp.update(attending: true)
    end

    # ^^ this method creates new rsvps for the same user if they unrsvp then rsvp again, at some point we should change this.

    payment = StripePayment.new
    customer = payment.create_customer(current_member, rsvp.stripe_token)
    payment.create_charge(customer, @event)
    redirect_to events_path
  end

  def unrsvp
    authenticate_member!
    @event = Event.find_by_id(params[:id])
    rsvp = @event.rsvps.where(member: current_member).where(attending: true)
    rsvp.update(attending: false)
    redirect_to event_path(@event.id)
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

end
