class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true, length: { minimum: 6, maximum: 15 }

  validates :email, presence: true, uniqueness: true
end
