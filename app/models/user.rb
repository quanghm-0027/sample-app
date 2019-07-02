class User < ApplicationRecord
  before_save :downcase_email
  validates :name,  presence: true, length: {maximum: Settings.name_max}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.email_max},
            format: {with: VALID_EMAIL_REGEX},
            uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.pass_min}

  private

  def downcase_email
    email.downcase!
  end
end
