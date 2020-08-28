# frozen_string_literal: true

class User < ApplicationRecord
  has_many :articles
  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { minimum: 4, maximum: 20 },
                       uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
  validates :user_id, presence: true

  has_secure_password
end
