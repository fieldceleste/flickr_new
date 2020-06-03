class ProfilesController < ApplicationController

  def index
  end

  def new 
    @profile = Profile.new
  end

  def create 
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profiles_path
    else
      render :new
    end
  end
  
  def show
    @profile = Profile.find(params[:id])
  end
  
  def edit 
    @profile = Profile.find(params[:id])
  end

  def update 
    @profile = Profile.find(params[:id])
    @profile.profile_photos.attach(params[:profile][:profile_photos])
    if @profile.update(profile_params)
      redirect_to profiles_path
      else
      render :edit
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to "/profiles/new"
  end

  private
  def profile_params
    params.require(:profile).permit(:content, :user_id, :photo_id)
  end
end







  