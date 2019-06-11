class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :reports_num, :first_name, :last_name, :email, :image, :created_at
  has_one :user_geolocation
  # has_many :reports


end
