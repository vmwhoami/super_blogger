class User < ApplicationRecord
    validates  :username , presence: true, length: {minimum:4, maximum:20}, 
		 uniqueness: {case_sensitive:false }

		 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

		 validates :email , presence: true, uniqueness: {case_sensitive:false },
		 format: { with: VALID_EMAIL_REGEX }
end