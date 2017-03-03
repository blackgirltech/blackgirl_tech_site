class SubscriptionsController < ApplicationController

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.create!(subscription_params)
    @subscription.update_attribute(:expiration_date, Date.today + 1.year)

    redirect_to current_user
  end

  # def edit
  #   @user = current_user
  #   @subscription = Subscription.find_by_id(:id)
  # end

  # def update
  #   # allow user to upgrade subscription
  #   # if user changes subscription, make old subscription inactive
  # end

  private

  def subscription_params
    params.permit(:user_id, :subscription_type, :expiration_date, :response_id, :redirect_url)
  end

end
