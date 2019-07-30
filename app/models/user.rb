class User < ApplicationRecord
  belongs_to :game, optional: true
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }
end
