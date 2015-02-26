class EmploymentRecordSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :employer
end