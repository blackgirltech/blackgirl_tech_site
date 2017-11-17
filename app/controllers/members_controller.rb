class MembersController < ApplicationController

  def show
    @member = current_member
    @regular_donation = @member.donations.last
  end
end
