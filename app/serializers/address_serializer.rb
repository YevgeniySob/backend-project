class AddressSerializer < ActiveModel::Serializer
  attributes :street, :city, :zipcode
end
