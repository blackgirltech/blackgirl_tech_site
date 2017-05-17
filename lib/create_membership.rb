class CreateMembership
  attr_reader :client

  def initialize(client: nil)
    @client = client || GoCardlessMembership.new
  end

  def create(member, params)
    if params[:membership_type] == "BASE"
      Freemembership.create!(membership_type: params[:membership_type], member_id: member.id, expiration_date: Date.today + 1.year)
      return
    elsif params[:membership_type] == "CLUB"
      membership = Membermembership.create!(membership_type: params[:membership_type], member_id: member.id, expiration_date: Date.today + 1.year)
      get_response_from_payment_gateway(membership, params)
    elsif params[:membership_type] == "ALLY"
      membership = Allymembership.create!(membership_type: params[:membership_type], member_id: member.id, expiration_date: Date.today + 1.year)
      get_response_from_payment_gateway(membership, params)
    end
  end

  private

  def get_response_from_payment_gateway(membership, params)
    response = client.redirect_flow(membership.membership_type, params[:authenticity_token], params[:success_redirect_url])
    membership.update!(redirect_url: response.redirect_url, response_id: response.id)
    membership
  end
end