class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def user
    @user = User.from_omniauth(request.env["omniauth.auth"])
  end

  def facebook
    user
    if @user.persisted?
      sign_in_and_redirect @user
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_path
    end
  end

  def twitter
    user
    if @user.persisted?
      sign_in_and_redirect @user
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_path
    end
  end

  def google_oauth2
    user
    if @user.persisted?
      sign_in_and_redirect @user
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_path
    end
  end

  def failure
    redirect_to root_path
  end
end