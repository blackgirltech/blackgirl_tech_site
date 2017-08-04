class MembershipsController < ApplicationController

  def new
    if (active_member?) && (current_member.most_recent_membership.paid? || current_member.most_recent_membership.free?)
      redirect_to current_member
    else
      @membership = Membership.new
    end
  end

  # Membership checkout/show pages

  def club_membership
    @membership = ClubMembership.new
  end

  def create_club_membership
    @membership = ClubMembership.create!(membership_params)
    create_club_membership(current_member, @membership)
    redirect_to current_member
  end

  def create_club_membership(member, membership)
    client = StripePayment.new
    if current_member.customer_id.nil?
      customer = client.create_customer(current_member)
      current_member.update(customer_id: customer.id)
    else
      customer = current_member
    end
    subscription = client.subscribe(customer.customer_id, membership)
    membership.update(stripe_subscription_id: subscription.id)
  end
# ########

  def ally_membership
    @membership = AllyMembership.new
  end

  def create_ally_membership
    @membership = AllyMembership.create!(membership_params)
    create_ally_membership(current_member, @membership)
    redirect_to current_member
  end

  def create_ally_membership(member, membership)
    client = StripePayment.new
    if current_member.customer_id.nil?
      customer = client.create_customer(current_member)
      current_member.update(customer_id: customer.id)
    else
      customer = current_member
    end
    subscription = client.subscribe(customer.customer_id, membership)
    membership.update(stripe_subscription_id: subscription.id)
  end

#########
  def base_membership
    @membership = BaseMembership.new
  end

  def create_base_membership
    @membership = BaseMembership.create!(membership_params)
    redirect_to current_member
  end

  def cancel
    @membership = Membership.find_by_id(params[:membership_id])
    if subscription = Stripe::Subscription.retrieve(@membership.stripe_subscription_id)
      subscription.delete(:at_period_end => true)
    end
    @membership.update(cancellation_date: Date.today)
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
