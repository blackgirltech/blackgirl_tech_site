class StaticPagesController < ApplicationController

  def home
  end
  
  def about
    @event = Event.last
  end

  def code_of_conduct
  end

  def donate
  end

  def subscribe
  end
end
