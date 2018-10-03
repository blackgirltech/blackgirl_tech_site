module Admin
  class ApplicationsController < ApplicationController
    before_action :authenticate_admin!

    def index # GET
      @opportunity = Opportunity.find(params[:opportunity_id])
      @applications = @opportunity.applications
    end

    def awarded_email
      member = Application.find_by(params[:id]).member
      AwardedEmailJob.perform_later(member)
    end
  end
end
