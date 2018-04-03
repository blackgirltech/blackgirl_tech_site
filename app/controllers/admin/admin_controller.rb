class Admin::AdminController < ApplicationController
  before_action :authenticate_admin!
  def dashboard
    @members = Member.all
    @events = Event.all
    @rsvps = Rsvp.all
    @opportunities = Opportunity.all
    @donations = Donation.all
  end

end
