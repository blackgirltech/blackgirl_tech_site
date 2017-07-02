class MembershipsController < ApplicationController

  def new
    if (active_member?) && (current_member.most_recent_membership.paid? || current_member.most_recent_membership.free?)
      redirect_to current_member
    else
      @membership = Membership.new
    end
  end

  # Membership checkout/show pages
  def base_membership
  end

  def club_membership
    @membership = ClubMembership.new
  end

  def create_club_membership
    @membership = ClubMembership.create!(membership_params)
    CreateMembership.create(current_member, @membership)
    redirect_to current_member
  end

  def ally_membership
    @membership = AllyMembership.new
  end

  def create_ally_membership
    @membership = AllyMembership.create!(membership_params)
    CreateMembership.create(current_member, @membership)
    redirect_to current_member
  end

  def base_membership
    @membership = BaseMembership.new
  end

  def create_base_membership
    @membership = BaseMembership.create!(membership_params)
    redirect_to current_member
  end

  def cancel
    # cancel = CancelMembership.new
    # cancel.cancel(current_member)
    # membership = current_member.memberships.create!(membership_type: "BASE", expiration_date: Date.today + 1.year)
    # redirect_to current_member
  end

  def edit
    @membership = Membership.find(params[:id])
  end

  def update
    old_sub = Membership.find(params[:id])
    old_sub.update!(cancellation_date: Time.now)
    create
  end

  private

  def membership_params
    params.permit(:member_id, :membership_type, :response_id, :redirect_url).merge(expiration_date: Time.now + 1.year)
  end

end
