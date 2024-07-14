# This model represents a Devise user
class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :registerable, :rememberable, :validatable

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
