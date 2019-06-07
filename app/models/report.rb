class Report < ApplicationRecord
  belongs_to :user
  belongs_to :state

  has_many :comments
  has_many :report_geolocations
  has_one :address
end
