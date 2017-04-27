class MailchimpSubscription
  require 'mailchimp'
  def mailchimp
    Mailchimp::API.new("0b77fc4821141002ea9e3d0f89a9a4fa-us10")
  end

  def subscribe_to_newsletter(user)
    mailchimp.lists.subscribe(
      "b3d85f1dae", 
     { "email" => user.email
     }
    )
  end

  def subscribe_to_free_list(user)
    mailchimp.lists.subscribe(
      "f115e2380f", 
     { "email" => user.email
     }
    )
  end

  def subscribe_to_member_list(user)
    mailchimp.lists.subscribe(
      "b3d85f1dae", 
     { "email" => user.email
     }
    )
  end

  def subscribe_to_ally_list(user)
    mailchimp.lists.subscribe(
      "bcc669c37f", 
     { "email" => user.email
     }
    )
  end
end