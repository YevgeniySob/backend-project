class User < ApplicationRecord
  has_one :user_geolocation
  has_many :reports
  has_many :comments

  has_secure_password

  validates :username, presence: true, uniqueness: true, case_sensitive: false
  # validates :email, presence: true, uniqueness: true, case_sensitive: false
end
