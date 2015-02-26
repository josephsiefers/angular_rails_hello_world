FactoryGirl.define do
  factory :profile do
  	name "Test"
  	user

  	transient do
  		employment_record_count 2
  	end
  	trait :with_employment_records do
  		after(:create) do |profile, evaluator|
  			create_list(:employment_record, evaluator.employment_record_count, profile: profile)
  		end
  	end
  end
end