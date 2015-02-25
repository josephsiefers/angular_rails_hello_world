class Api::V1::ProfilesController < ApplicationController
  def index
  	@profiles = Profile.all

  	render json: @profiles, root: false
  end

  def update
  	@profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      render json: @profile
    else
      render json: {}, status: :unprocessable_entity 
    end
  end

  def profile_params
  	params.require(:profile).permit(:name, user_attributes: [:email])
  end
end