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
    if @application = Application.find_by(id: params[:id], submitted: false, member_id: current_member.id)
      @opportunity = @application.opportunity_id
    else
      @application = Application.find_by(id: params[:id], member_id: current_member.id)
      redirect_to application_path(@application)
    end
  end

  def update
    @application = Application.find_by(id: params[:id], submitted: false, member_id: current_member.id)
    @application.update(application_params)
    if params[:commit] == "Submit"
      @application.update(submitted: true)
      # display notices dependent on if it's saved or submitted
    end
    redirect_to application_path(@application)
  end

  def show
    @application = Application.find_by(id: params[:id], member_id: current_member.id)
    @member = Member.find(@application.member_id)
  end

  def destroy
    @application = Application.find_by(id: params[:id], member_id: current_member.id)
    @application.destroy
    redirect_to root_path
  end

  private
  def application_params
    params.require(:application).permit(:opportunity_id, :member_id, :cv, :longlist, :shortlist, :finalist, :awarded, :cover_letter, :notes)
  end
end
