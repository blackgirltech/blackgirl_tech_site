class MembersController < ApplicationController

  def show
    @member = current_member
    @sub = @member.most_recent_subscription
  end
end
