module Admin
  class ApplicationsController < ApplicationController
    before_action :authenticate_admin!

    def index # GET
      @opportunity = Opportunity.find(params[:opportunity_id])
      @applications = @opportunity.applications
    end
  end
end
