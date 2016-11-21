class SessionForm
  include ActiveModel::Model
  attr_accessor :email, :password
  validates :email, email: { strict_mode: true }
  validates :password, length: { minimum: 6 }
end
