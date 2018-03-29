class OpportunitiesController < ApplicationController
  def index
    @opportunities = Opportunity.all
  end

  def edit
  end

  def update
  end

  def delete
  end

  def show
    @opportunity = Opportunity.find(params[:id])
  end

  def new
  end

  def create
  end
end
