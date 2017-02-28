class SubscriptionsController < ApplicationController

  def index
    redirect_to new_subscription_path
  end

  def new
    @subscription = Subscription.new
  end

  def create
    if user_signed_in?
      a_year_from_today = Date.today + 1.year

      @subscription = Subscription.create!(subscription_params)
      @subscription.update_attributes(expiration_date: a_year_from_today)

      redirect_to current_user
    else
      redirect_to new_user_session_path
    end
  end

  private

  def subscription_params
    params.permit(:user_id, :subscription_type, :expiration_date, :response_id, :redirect_url)
  end

end
