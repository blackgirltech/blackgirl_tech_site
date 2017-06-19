class Forest::RsvpsController < ForestLiana::ApplicationController
  def check_in
    @rsvp = Rsvp.find_by_id(params[:id])
    @rsvp.update(checked_in: true)
    render nothing: true, status: 204
  end
end
