class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :image
  has_one :user_geolocation
  # has_many :comments
end
