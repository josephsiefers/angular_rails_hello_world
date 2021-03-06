class Profile < ActiveRecord::Base
	belongs_to :user
	accepts_nested_attributes_for :user, update_only: true

	has_many :employment_records
	has_many :employers, through: :employment_records
	accepts_nested_attributes_for :employment_records

	delegate :email, to: :user, prefix: false, allow_nil: true
end