class Forest::RsvpsController < ForestLiana::ApplicationController
  def check_in
    @rsvps = []
    @rsvps << Rsvp.where(id: params[:data][:attributes][:ids])
    @rsvps.each { |r| r.update(checked_in: true) }
    render nothing: true, status: 204
  end
end
