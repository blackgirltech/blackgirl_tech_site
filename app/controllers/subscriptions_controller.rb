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
      subscription = Subscription.create!(subscription_params)
      # if subscription.subscription_type != "free"
      initialize_subscription = CreateSubscription.new
      initialize_subscription.create(current_user, params)
      complete_subscription = CompleteSubscription.new
      complete_subscription.complete(current_user, params)

      # end
      redirect_to current_user
    end
  end

  def edit
    @subscription = Subscription.find(params[:id])
  end

  def update
    # allow user to upgrade subscription
    # if user changes subscription, make old subscription inactive
    Subscription.find(params[:id]).update!(cancellation_date: DateTime.now)
    Subscription.create!(subscription_params)
    redirect_to current_user
  end

  private

  def subscription_params
    params.permit(:user_id, :subscription_type, :response_id, :redirect_url).merge(expiration_date: Date.today + 1.year)
  end

end
