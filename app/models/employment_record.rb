class EmploymentRecord < ActiveRecord::Base
	belongs_to :profile
	belongs_to :employer
	accepts_nested_attributes_for :employer
end
