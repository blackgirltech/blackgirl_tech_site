module Admin
  class ApplicationsController < ApplicationController
    before_action :authenticate_admin!

    def index
      @opportunity = Opportunity.find(params[:opportunity_id])
      @applications = @opportunity.applications.where(submitted: true)
    end

    def show
      @application = Application.find_by(id: params[:id], member_id: current_member.id)
      @member = Member.find(@application.member_id)
    end

    def awarded_email
      application = Application.find_by(id: params[:id])
      return unless application.awarded

      member = application.member
      AwardedEmailJob.perform_later(member)
      application.update(awarded_email_sent: true)
      redirect_to admin_application_path(application)
    end
  end
end
