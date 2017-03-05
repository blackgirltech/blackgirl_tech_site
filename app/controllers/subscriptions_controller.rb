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
      @subscription = Subscription.create!(subscription_params)
      @subscription.update_attribute(:expiration_date, Date.today + 1.year)
      redirect_to current_user
    end
  end

  def edit
    @subscription = Subscription.find_by_id(params[:id])
  end

  def update
    # allow user to upgrade subscription
    # if user changes subscription, make old subscription inactive
    @subscription = Subscription.find_by_id(params[:id])
    @subscription.update_attribute(:cancellation_date, DateTime.now)
    @new_subscription = Subscription.new
    # @new_subscription = Subscription.create!(subscription_params)
  end

  private

  def subscription_params
    params.permit(:user_id, :subscription_type, :expiration_date, :response_id, :redirect_url)
  end

end
