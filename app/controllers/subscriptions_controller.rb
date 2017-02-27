class SubscriptionsController < ApplicationController

  def new
    @subscription = Subscription.new
  end

  def create
    # expiration date should be Date.today + 1.year
    # how will we create with a mutliple options? Might have to manually post to create in href on new page
    @subscription = Subscription.create!(subscription_params)
    a_year_from_today = Date.today + 1.year
    @subscription.update_attribute(:expiration_date, a_year_from_today)
    redirect_to root_path
  end

  private

  def subscription_params
    params.permit(:user_id, :subscription_type, :expiration_date, :response_id, :redirect_url)
  end

end
