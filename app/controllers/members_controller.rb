class MembersController < ApplicationController

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update!(member_params)
    redirect_to member_path(@member)
  end

  def show
    @member = current_member
  #   TODO: Add notice for if user has unconfirmed email
  end

  def show_unsubscribe
    @member = Member.find(params[:member_id])
  end

  def unsubscribe
    @member = Member.find(params[:member_id])
    @member.update(subscribed_to_email: false)
    flash[:notice] = "You have sucessfully unsubscribed"
    redirect_to root_path
  end

  private
  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, skill_ids: [])
  end

end
