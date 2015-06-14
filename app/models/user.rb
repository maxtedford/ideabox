class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true

   has_many :ideas

  validates :username,
    presence: true,
    uniqueness: true
  validates :password,
    presence: true

  enum role: %w(default, admin)
end
