class User < ApplicationRecord
  rolify
  ratyrate_rater
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	after_create :assign_default_rolt_to_user
  has_one :authentication_token, dependent: :destroy

 	def assign_default_rolt_to_user
 		add_role(:user)
 	end

	def admin?
	  has_role?(:admin)
	end

	def user?
	  has_role?(:user)
	end 

	def generate_authentication_token
    token = SecureRandom.hex(16)
    user_auth = AuthenticationToken.find_by(user_id: id)
    if user_auth.present?
      user_auth.update_attributes(auth_token: token, user_id: id)
    else
      user_auth = AuthenticationToken.create!(auth_token: token, user_id: id)
    end
    binding.pry
    user_auth
  end
end
