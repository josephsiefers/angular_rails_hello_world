class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user
  has_many :employment_records
end