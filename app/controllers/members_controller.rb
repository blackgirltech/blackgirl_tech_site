class MembersController < ApplicationController

  def show
    @member = current_member
    @regular_donation = @member.donations.last
    @events = Event.upcoming.limit(3)
  end
end
