class MansionRoomSerializer < ActiveModel::Serializer
  belongs_to :mansion
  has_many :mansion_room_photos
  

  attributes :id
  attributes :name
  attributes :layout
  attributes :thanksMoney
  attributes :securityDeposit
  attributes :floorNumber
  attributes :mansion_id
  attributes :stayFee
  attributes :rent
  attributes :maintenanceFee
  attributes :contractDuration
end