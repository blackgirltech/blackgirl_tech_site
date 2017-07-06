class MembershipsController < ApplicationController

  def new
    if (active_member?) && (current_member.most_recent_membership.paid? || current_member.most_recent_membership.free?)
      redirect_to current_member
    else
      @membership = Membership.new
    end
  end

  def create
    # Cancel incomplete memberships
    members_last_membership = current_member.most_recent_membership
    if members_last_membership.present? && members_last_membership.cancellation_date.nil?
      current_member.most_recent_membership.update!(cancellation_date: Time.now)
    end

    initialize_membership = CreateMembership.new
      initialize_membership.create(
      current_member,
      membership_type: params[:membership_type],
      authenticity_token: session[:_csrf_token],
      success_redirect_url: complete_membership_url(current_member)
    )
    membership = current_member.most_recent_membership
    if membership.free?
      # Mailchimpmembership.new.subscribe_to_newsletter(current_member)
      redirect_to current_member
    else
      redirect_to membership.redirect_url
    end
  end

  def complete
    complete = CompleteMembership.new
    complete.complete(
      current_member,
      redirect_flow_id: params[:redirect_flow_id],
      # authenticity token is nil here bc rails only gives authenticity tokens to post/put/patch/delete requests
      # this is a get http://stackoverflow.com/questions/941594/understanding-the-rails-authenticity-token
      authenticity_token: session[:_csrf_token]
    )
    # MailchimpMembership.new.subscribe_to_newsletter(current_member)
    redirect_to current_member
  end

  def cancel
    cancel = CancelMembership.new
    cancel.cancel(current_member)
    membership = current_member.memberships.create!(membership_type: "BASE", expiration_date: Time.now + 1.year)
    redirect_to current_member
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
