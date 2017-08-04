class CreateDonation

  def create_donation(params)
    token = params[:stripe_token]
    amount = convert_to_pence(params[:amount].to_i)

    # Charge the user's card:
    donation = Stripe::Charge.create(
      :amount => amount,
      :currency => "gbp",
      :description => "Donation",
      :source => token,
    )
  end

end
