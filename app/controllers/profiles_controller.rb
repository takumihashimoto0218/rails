class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show
  end
  
  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save!
      redirect_to boards_path, notice: 'プロフィールを登録しました'
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: '更新しました'
    else
      render :edit
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :self_introduction, :profile_image)
    end

    def set_profile
      @profile = current_user.profile
    end
end
