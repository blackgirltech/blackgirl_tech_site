class SubscriptionsController < ApplicationController

  def index
    redirect_to new_subscription_path
  end

  def new
    @subscription = Subscription.new
  end

  def create
    if user_signed_in?
      @subscription = Subscription.create!(subscription_params)

      redirect_to current_user
    else
      redirect_to new_user_session_path
    end
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
