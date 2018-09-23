module Admin
  class ApplicationsController < ApplicationController
    before_action :authenticate_admin!

    def show
      @application = Application.find(params[:id])
    end

    def edit
    end

    def update
    end

    def index
      @applications = Application.all
    end

  end
end
