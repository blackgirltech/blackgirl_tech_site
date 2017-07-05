class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def member
    @member = Member.from_omniauth(request.env["omniauth.auth"])
  end

  def facebook
    member
    if @member.persisted?
      sign_in_and_redirect @member
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_member_registration_path
    end
  end

  def twitter
    member
    if @member.persisted?
      sign_in_and_redirect @member
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_member_registration_path
    end
  end

  def google_oauth2
    member
    if @member.persisted?
      sign_in_and_redirect @member
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_member_registration_path
    end
  end

  def failure
    redirect_to root_path
  end
end