class OpportunitiesController < ApplicationController
  def index
    @opportunities = Opportunity.where("deadline > ?", DateTime.now.to_date)
                                .where(live: true)
  end

  def show
    @opportunity = Opportunity.find(params[:id])
  end
end
