class OwnerSerializer < ActiveModel::Serializer
  has_many :rental_houses

  attributes :uid
  attributes :email
  attributes :first_name
  attributes :last_name
end
