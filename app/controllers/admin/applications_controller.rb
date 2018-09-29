module Admin
  class ApplicationsController < ApplicationController
    before_action :authenticate_admin!

    def index # GET
      @applications = Application.all
    end

    def edit # GET
      if @application = Application.find_by(id: params[:id], submitted: false, member_id: current_member.id)
        @opportunity = @application.opportunity_id
      else
        @application = Application.find_by(id: params[:id], member_id: current_member.id)
        redirect_to application_path(@application)
      end
    end

    def update # POST
      @application = Application.find_by(id: params[:id], submitted: false, member_id: current_member.id)
      @application.update(application_params)
      if params[:commit] == "Submit"
        @application.update(submitted: true)
        # display notices dependent on if it's saved or submitted
      end
      redirect_to application_path(@application)
    end

    def show # GET
      @application = Application.find_by(id: params[:id], member_id: current_member.id)
      @member = Member.find(@application.member_id)
    end

    def destroy # POST
      @application = Application.find_by(id: params[:id], member_id: current_member.id)
      @application.destroy
      redirect_to root_path
    end

    private
    def application_params
      params.require(:application).permit(:opportunity_id, :member_id, :cv, :longlist, :shortlist, :finalist, :awarded, :cover_letter, :notes)
    end
  end
end
