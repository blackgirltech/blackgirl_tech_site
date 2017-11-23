class ResourcesController < ApplicationController

  def index
    @resources = Resource.all
  end

  def new
    # authenticate_admin!
    @resource = Resource.new
  end

  def create
    # authenticate_admin!
    @resource = Resource.create!(resource_params)
    redirect_to resources_path
  end

  def edit
    # authenticate_admin!
    @resource = Resource.find(params[:id])
  end

  def update
    # authenticate_admin!
    @resource = Resource.find(params[:id])
    @resource.update(resource_params)
    redirect_to resources_path
  end

  def destroy
    # authenticate_admin!
    @resource = Resource.find(params[:id])
    @resource.delete
    redirect_to resources_path
  end

  private
  def resource_params
    params.require(:resource).permit(:title, :preview_description, :description, :external_url)
  end
end
