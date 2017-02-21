class SubscriptionsController < ApplicationController

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.create!(sub_params)
    redirect_to user_path(current_user)
  end

  private

  def sub_params
    params.require(:link).permit(:user_id, :subscription_type, :expiration_date, :response_id, :redirect_url)
  end

end
