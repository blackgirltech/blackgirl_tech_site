class MembershipsController < ApplicationController

  def new
    if (active_member?) && (current_member.most_recent_membership.paid? || current_member.most_recent_membership.free?)
      redirect_to current_member
    else
      @membership = Membership.new
    end
  end

  def edit
    @membership = Membership.find(params[:id])
  end

  def update
    old_sub = Membership.find(params[:id])
    old_sub.update!(cancellation_date: Time.now)
    create
  end

  def cancel
    canellation = CancelMembership.new
    canellation.cancel
    redirect_to current_member
  end

  # Membership checkout/show pages

  # CLUB MEMBERSHIP

  def club_membership
    @membership = ClubMembership.new
  end

  def create_club_membership
    @membership = ClubMembership.create!(membership_params)
    create_and_redirect(current_member, @membership)
  end

# ALLY MEMBERSHIP

  def ally_membership
    @membership = AllyMembership.new
  end

  def create_ally_membership
    @membership = AllyMembership.create!(membership_params)
    create_and_redirect(current_member, @membership)
  end

# BASE MEMBERSHIP
  def base_membership
    @membership = BaseMembership.new
  end

  def create_base_membership
    @membership = BaseMembership.create!(membership_params)
    redirect_to current_member
  end

  private

  def membership_params
    params.permit(:member_id, :membership_type, :response_id, :redirect_url).merge(expiration_date: Time.now + 1.year)
  end

  def create_and_redirect(member, membership)
    stripe_subscription = CreateMembership.new
    stripe_subscription.create(member, membership, params[:stripe_source])
    redirect_to current_member
  end

end
