class OpportunitiesController < ApplicationController
  def index
    @opportunities = Opportunity.where("deadline > ?", DateTime.now.to_date )
  end

  def show
    @opportunity = Opportunity.find(params[:id])
  end

  def destroy
    @opportunity = Opportunity.find(params[:id]
    @opportunity.destroy
    redirect_to opportunities_path
  end

end
