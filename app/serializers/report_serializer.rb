class ReportSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :votes, :image, :date, :time
  belongs_to :user
  belongs_to :state

  has_many :comments
  has_one :report_geolocation
  has_one :address
end
