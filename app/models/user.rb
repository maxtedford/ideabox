class User < ActiveRecord::Base
  has_many :ideas

  has_secure_password

  validates :username,
    presence: true,
    uniqueness: true
  validates :password,
    presence: true

  enum role: %w(default, admin)
end
