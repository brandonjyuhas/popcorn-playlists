class User < ActiveRecord::Base
  has_many :rooms_users
  has_many :rooms, :through => :rooms_users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]

   def self.from_omniauth(auth)
   	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
   		user.password = Devise.friendly_token[0,20]
   		user.username = auth.info.name
   		user.image = auth.info.image
   	end
   end

   def email_required?
	  false
	end
end
