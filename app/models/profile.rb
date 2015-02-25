class Profile < ActiveRecord::Base
	belongs_to :user
	accepts_nested_attributes_for :user, update_only: true

	delegate :email, to: :user, prefix: false, allow_nil: true
end