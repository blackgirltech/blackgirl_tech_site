module Admin
  class OpportunitiesController < ApplicationController
    before_action :authenticate_admin!
    def new
      @opportunity = Opportunity.new
    end

    def create
      @opportunity = Opportunity.create!(opportunity_params)
    end

    def edit
      @opportunity = Opportunity.find(params[:id])
    end

    def update
      @opportunity = Opportunity.find(params[:id])
      @opportunity.update(opportunity_params)
    end

    def delete
    end

    private
    def opportunity_params
      params.require(:opportunity).permit(:name, :description, :deadline, :company, :company_bio)
    end
  end
end
