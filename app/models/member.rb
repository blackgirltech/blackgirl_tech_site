class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook, :twitter, :google_oauth2]

  has_many :subscriptions

  validates_presence_of :address_line_one, :city, :postcode, :first_name, :last_name

  def most_recent_subscription
    self.subscriptions.last
  end

  def current_subscription_type
    self.most_recent_subscription.subscription_type
  end

  def active_subscription?
    if self.most_recent_subscription.present?
      self.most_recent_subscription.expiration_date >= Date.today && self.most_recent_subscription.cancellation_date.nil?
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |member|
      member.email = auth.info.email
      member.password = Devise.friendly_token[0,20]
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # member.skip_confirmation!
    end
  end
end