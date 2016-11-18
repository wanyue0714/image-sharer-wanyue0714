class User < ApplicationRecord
  before_save { email.downcase! }
  has_secure_password
  validates :email, email: { strict_mode: true },
                    uniqueness: { case_sensitive: false }
  validates :name, length: { minimum: 4 }
  validates :password, length: { minimum: 6 }, if: :password
end
