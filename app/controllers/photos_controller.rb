class PhotosController < ApplicationController
  def index 
    @photos = Photo.all
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit 
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photos_psth
    else
      render :edit
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to "/photos"
  end
  
  private
  def photo_params
    params.require(:photo).permit(:title, :user_id, :image)
  end
end