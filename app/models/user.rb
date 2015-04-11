class User < ActiveRecord::Base
	before_save :downcase_email 

	has_many :orders
	
	validates :first_name, presence: true, length: { maximum: 50 }
	validates :last_name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, 
										format: { with: VALID_EMAIL_REGEX },
										uniqueness: { case_sensitive: false } # implied uniqueness:true

	has_secure_password # ability to save a password_digest attribute
											# virtual attributes password & password_confirmation,
											# an authenticate method is added to the model to log in users

  # allow blank for users who are editing. 
  # New users has_secure_password will fail for missing password
  validates :password, length: { minimum: 6 }, allow_blank: true

	private 
		def downcase_email
      email.downcase! # bang modifies the attribute directly (self)
    end
end
