class User < ApplicationRecord
  has_many :positions
  has_many :assets

  has_secure_password
  validates :email, presence: true, uniqueness: true
end
