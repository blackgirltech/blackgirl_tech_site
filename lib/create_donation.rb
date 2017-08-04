class CreateDonation

  def create_donation(token, amount)

    # Charge the user's card:
    donation = Stripe::Charge.create(
      :amount => amount,
      :currency => "gbp",
      :description => "Donation",
      :source => token,
    )
  end

end
