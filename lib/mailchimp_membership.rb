class MailchimpMembership
  require 'mailchimp'
  def mailchimp
    Mailchimp::API.new("0b77fc4821141002ea9e3d0f89a9a4fa-us10")
  end

  def subscribe_to_newsletter(member)
    mailchimp.lists.subscribe(
      "b3d85f1dae", 
     { "email" => member.email
     }
    )
  end

  def subscribe_to_free_list(member)
    mailchimp.lists.subscribe(
      "f115e2380f", 
     { "email" => member.email
     }
    )
  end

  def subscribe_to_member_list(member)
    mailchimp.lists.subscribe(
      "b3d85f1dae", 
     { "email" => member.email
     }
    )
  end

  def subscribe_to_ally_list(member)
    mailchimp.lists.subscribe(
      "bcc669c37f", 
     { "email" => member.email
     }
    )
  end
end