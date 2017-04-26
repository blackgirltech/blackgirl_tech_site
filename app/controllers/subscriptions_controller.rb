class SubscriptionsController < ApplicationController

  def new
    if subscribed_user?
      redirect_to current_user
    else
      @subscription = Subscription.new

    end
  end

  def create
    if subscribed_user?
      redirect_to current_user
    else
      initialize_subscription = CreateSubscription.new
        initialize_subscription.create(
        current_user, 
        subscription_type: params[:subscription_type],
        authenticity_token: session[:_csrf_token],
        success_redirect_url: complete_subscription_url(current_user)
      )
      subscription = current_user.most_recent_subscription
      if subscription.subscription_type == "FREE"
        redirect_to current_user
      else
        redirect_to subscription.redirect_url
      end
    end
  end

  def complete
    complete = CompleteSubscription.new
    complete.complete(
      current_user,
      redirect_flow_id: params[:redirect_flow_id],
      # authenticity token is nil here bc rails only gives authenticity tokens to post/put/patch/delete requests
      # this is a get http://stackoverflow.com/questions/941594/understanding-the-rails-authenticity-token
      authenticity_token: session[:_csrf_token]
    )
    redirect_to current_user
  end

  def cancel
    cancel = CancelSubscription.new
    cancel.cancel(current_user)
    redirect_to current_user
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
    params.permit(:user_id, :subscription_type, :response_id, :redirect_url).merge(expiration_date: Date.today + 1.year)
  end

end
