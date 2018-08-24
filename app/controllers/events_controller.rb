class EventsController < ApplicationController

  def index
    @workshops = Event.where(workshop: true).order(date: :asc)
    @masterclasses = Event.where(masterclass: true).order(date: :asc)
    @events = Event.where("date > ?", Date.today).order(date: :asc)
  end

  def show
    @event = Event.find_by_id(params[:id])
    @rsvp = @event.rsvps.where(member_id: current_member, event_id: @event.id, attending: true)
    @volunteer = @event.rsvps.where(member_id: current_member, event_id: @event.id, volunteering: true)
  end

  def rsvp
    # authenticate_member!
    @event = Event.find_by_id(params[:id])

    rsvp_params = {
      stripe_source: params[:stripe_source],
      email: params[:event][:rsvps][:email]
    }

    unless current_member.present?
      # If the member is coming via email reminder the email field should be populate. If we have their card details, the form shouldn't be displayed.
      Member.invite!(email: rsvp_params[:email]) unless Member.find_by_email(rsvp_params[:email])
      member = Member.find_by_email(rsvp_params[:email])
    else
      member = current_member
    end

    rsvp = Rsvp.find_or_create_by!(
      event_id: @event.id,
      member: member,
      donate: params[:event][:rsvps][:donate]
    )

    if rsvp.attending.nil? || !rsvp.attending
      rsvp.update(attending: true)
    end

    # ^^ this method creates new rsvps for the same user if they unrsvp then rsvp again, at some point we should change this.

    payment = EventPayment.new
    payment.pay(current_member, rsvp, rsvp_params)
    redirect_to event_thanks_path(@event.id)
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
    redirect_to event_thanks_path(@event.id)
  end

  def unvolunteering
    authenticate_member!
    @event = Event.find_by_id(params[:id])
    rsvp = @event.rsvps.where(member: current_member).where(volunteering: true)
    rsvp.update(volunteering: false)
    redirect_to "/events/#{@event.id}"
  end

  def thanks
    @event = Event.find_by_id(params[:id])
  end

end
