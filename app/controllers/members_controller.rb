class MembersController < ApplicationController

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update!(member_params)
    redirect_to member_path(@member)
  end

  def show
    @member = current_member
    @regular_donation = @member.donations.last
    @events = Event.upcoming.limit(3)
    @attended_events_count = Rsvp.where(attending: true, member_id: current_member).count && Rsvp.where(volunteering: true, member_id: current_member).count
  end

  private
  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, skill_ids: [])
  end

end
