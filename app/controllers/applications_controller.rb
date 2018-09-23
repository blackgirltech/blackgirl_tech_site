class ApplicationsController < ApplicationController

  def new
    @opportunity = Opportunity.find(params[:opportunity_id])
    @application = Application.new
  end

  def create
    @application = Application.create(application_params)
    if params[:commit] == "Submit"
      @application.update(submitted: true)
      redirect_to opportunities_path
      # redirect_to application_path(@application)
    else
      redirect_to opportunities_path
    end
  end

  def edit
  end

  def update
  end

  def show
    @application = Application.find(params[:id])
  end

  private
  def application_params
    params.require(:application).permit(:opportunity_id, :member_id, :cv, :longlist, :shortlist, :finalist, :awarded, :cover_letter)
  end
end
