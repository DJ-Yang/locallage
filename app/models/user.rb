class User < ApplicationRecord
  rolify
  
  after_create :assign_default_role
  
  def assign_default_role
  	add_role(:customer)
  end
  
  has_many :videos
  has_many :designs
  
  def self.find_or_create_from_auth_hash(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
			user.email = auth.info.email
			user.picture = auth.info.image
			user.password = "123qwerasdzxcasd1231431242112313fdsfdsfsf@##@$@#$$DFgfdgdfg123"
			user.save!
		end
	end
	
	# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
