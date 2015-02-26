require 'spec_helper'

describe Api::V1::ProfilesController do

	describe "PUT update" do
		describe "user attributes" do
			it "updates the nested email" do
				profile = create(:profile)

				expect { 
					put :update, { id: profile.id, profile: { id: profile.id, name: profile.name, user_attributes: { email: "john_smith@gmail.com" } } }
				}.to change { profile.reload.email }
			end

			it "does not create a new user" do
				profile = create(:profile)

				expect { 
					put :update, { id: profile.id, profile: { id: profile.id, name: profile.name, user_attributes: { email: "john_smith@gmail.com" } } }
				}.not_to change { User.count }			
			end

			it "does not allow the user to change a user model that does not belong to the profile (filtered by strong parameters)" do
				profile = create(:profile)
				user = create(:user)

				expect { 
					put :update, { id: profile.id, profile: { id: profile.id, name: profile.name, user_attributes: { id: user.id, email: "js@gmail.com" } } }
				}.not_to change { user.reload.email }
			end
		end

		describe "employment_records attributes" do
			it "updates a nested record" do
				profile = create(:profile, :with_employment_records)
				employment_record = profile.employment_records.first

				expect { 
					put :update, { id: profile.id, profile: { id: profile.id, name: profile.name, employment_records_attributes: { id: employment_record.id, title: "slave" } } }
				}.to change { employment_record.reload.title }		
			end

			it "does not create a new employment_record if an id is present" do
				profile = create(:profile, :with_employment_records)
				employment_record = profile.employment_records.first

				expect { 
					put :update, { id: profile.id, profile: { id: profile.id, name: profile.name, employment_records_attributes: { id: employment_record.id, title: "slave" } } }
				}.not_to change { EmploymentRecord.count }		
			end

			it "does not allow changes to other employment records" do
				profile = create(:profile, :with_employment_records)
				employment_record = create(:employment_record)

				expect { 
					put :update, { id: profile.id, profile: { id: profile.id, name: profile.name, employment_records_attributes: { id: employment_record.id, title: "slave" } } }
				}.to raise_error(ActiveRecord::RecordNotFound)					
			end

			it "creates a new employment_record" do
				profile = create(:profile, :with_employment_records)

				expect { 
					put :update, { id: profile.id, profile: { id: profile.id, name: profile.name, employment_records_attributes: { id: nil, title: "slave" } } }
				}.to change { EmploymentRecord.count }
			end

			it "allows an employer id to be supplied" do
				profile = create(:profile)
				employer = create(:employer)

				expect { 
					put :update, { id: profile.id, profile: { id: profile.id, name: profile.name, employment_records_attributes: { id: nil, title: "slave", employer_id: employer.id } } }
				}.to change { EmploymentRecord.count }				

				byebug
				puts 'test'
			end
		end

		describe "nested employer attributes" do
			# it "creates a new employer if one does not exist" do
			# 	profile = create(:profile)

			# 	expect { 
			# 		put :update, { id: profile.id, profile: { id: profile.id, name: profile.name, employment_records_attributes: { "0" => { id: nil, title: "slave", employer_attributes: {name: "Test"} } } } }
			# 	}.to change { Employer.count }
			# end

			it "doesn't allow a new employer to be created with the same name" do
				profile = create(:profile)
				duplicate_name = "Some Name"
				employer = create(:employer, name: duplicate_name)

				expect { 
					put :update, { id: profile.id, profile: { id: profile.id, name: duplicate_name, employment_records_attributes: { "0" => { id: nil, title: "slave", employer_attributes: {name: "Some Name"} } } } }
				}.not_to change { Employer.count }
			end
		end
	end
end