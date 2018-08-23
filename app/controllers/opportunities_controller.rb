class OpportunitiesController < ApplicationController
  def index
    @opportunities = Opportunity.where("deadline < ?", DateTime.now.to_date )
  end

  def edit
  end

  def update
  end

  def delete
  end

  def show
    authenticate_member!
    @opportunity = Opportunity.find(params[:id])

  end

  def new
  end

  def create
  end
end
