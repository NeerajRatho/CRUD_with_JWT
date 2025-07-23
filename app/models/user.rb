class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 6, maximum: 15 }, if: :password_digest_changed?

  validates :email, presence: true, uniqueness: true
end
