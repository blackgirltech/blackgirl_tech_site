class SubscriptionsController < ApplicationController

  def new
    if (subscribed_member?) && (current_member.most_recent_subscription.paid? || current_member.most_recent_subscription.free?)
      redirect_to current_member
    else
      @subscription = Subscription.new

    end
  end

  def create
    # Cancel incomplete subscriptions
    members_last_subscription = current_member.most_recent_subscription
    if members_last_subscription.present? && members_last_subscription.cancellation_date.nil?
      current_member.most_recent_subscription.update!(cancellation_date: Time.now)
    end
    
    initialize_subscription = CreateSubscription.new
      initialize_subscription.create(
      current_member, 
      subscription_type: params[:subscription_type],
      authenticity_token: session[:_csrf_token],
      success_redirect_url: complete_subscription_url(current_member)
    )
    subscription = current_member.most_recent_subscription
    if subscription.free?
      # MailchimpSubscription.new.subscribe_to_newsletter(current_member)
      redirect_to current_member
    else
      redirect_to subscription.redirect_url
    end
  end

  def complete
    complete = CompleteSubscription.new
    complete.complete(
      current_member,
      redirect_flow_id: params[:redirect_flow_id],
      # authenticity token is nil here bc rails only gives authenticity tokens to post/put/patch/delete requests
      # this is a get http://stackoverflow.com/questions/941594/understanding-the-rails-authenticity-token
      authenticity_token: session[:_csrf_token]
    )
    # MailchimpSubscription.new.subscribe_to_newsletter(current_member)
    redirect_to current_member
  end

  def cancel
    cancel = CancelSubscription.new
    cancel.cancel(current_member)
    subscription = current_member.subscriptions.create!(subscription_type: "FREE", expiration_date: Date.today + 1.year)
    redirect_to current_member
  end

  def edit
    @subscription = Subscription.find(params[:id])
  end

  def update
    old_sub = Subscription.find(params[:id])
    old_sub.update!(cancellation_date: Time.now)
    create
  end

  private

  def subscription_params
    params.permit(:member_id, :subscription_type, :response_id, :redirect_url).merge(expiration_date: Date.today + 1.year)
  end

end
