class ApplicationsController < ApplicationController

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def index
    @applications = Application.all
  end

  def show
    @application = Application.find(params[:id])
  end
end
