module Admin
  class ApplicationsController < ApplicationController
    before_action :authenticate_admin!

    def index
      @opportunity = Opportunity.find(params[:opportunity_id])
      @applications = @opportunity.applications.where(submitted: true)
    end

    def show
      @application = Application.find_by(id: params[:id])
      @member = Member.find(@application.member_id)
    end

    def edit
      @application = Application.find_by(id: params[:id])
      @opportunity_id = @application.opportunity_id
    end

    def update
      @application = Application.find_by(id: params[:id])
      @application.update!(application_params)
      redirect_to admin_application_path(@application)
    end

    def awarded_email
      application = Application.find_by(id: params[:id])
      return unless application.awarded

      member = application.member
      AwardedEmailJob.perform_later(member)
      application.update(awarded_email_sent: true)
      redirect_to admin_application_path(application)
    end
    private
    def application_params
      params.require(:application).permit(:opportunity_id, :longlist, :shortlist, :finalist, :awarded, :notes)
    end
  end
end
