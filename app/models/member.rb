class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :confirmable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :twitter, :google_oauth2]

  has_many :rsvps
  has_many :events, through: :rsvps
  has_many :donations
  has_many :applications
  validates_presence_of :first_name, :last_name

  # TODO: Add social media login
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create! do |member|
  #     member.email = auth.info.email
  #     member.password = Devise.friendly_token[0,20]
  #     # If you are using confirmable and the provider(s) you use validate emails,
  #     # uncomment the line below to skip the confirmation emails.
  #     # member.skip_confirmation!
  #   end
  # end
end
