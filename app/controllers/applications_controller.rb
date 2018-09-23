class ApplicationsController < ApplicationController
  before_action :authenticate_member!

  def new
    @opportunity = Opportunity.find(params[:opportunity_id])
    @application = Application.new
  end

  def create
    @application = Application.create(application_params)
    if params[:commit] == "Submit"
      @application.update(submitted: true)
      # display notices dependent on if it's saved or submitted
    end
    redirect_to application_path(@application)
  end

  def edit
  end

  def update
  end

  def show
    @application = Application.find_by(id: params[:id], member_id: current_member.id)
    @member = Member.find(@application.member_id)
  end

  private
  def application_params
    params.require(:application).permit(:opportunity_id, :member_id, :cv, :longlist, :shortlist, :finalist, :awarded, :cover_letter)
  end
end
