class ProfilesController < ApplicationController
  
  def show
    @profile = current_user.profile
  end
  
  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save!
      redirect_to boards_path
    else
      render :new
    end  
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :self_introduction)
    end
end
