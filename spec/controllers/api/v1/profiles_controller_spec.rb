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

		end
	end
end