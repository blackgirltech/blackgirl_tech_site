class UsersController < ApplicationController

  def show
    @user = current_user
    @sub = @user.most_recent_subscription
  end
end
