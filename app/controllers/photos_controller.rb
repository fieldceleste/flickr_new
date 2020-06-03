class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.images.attach(params[:photo][:image])
    if @photo.save
      flash[:notice] = "Your Photo has been saved"
      redirect_to photos_path
    else
      flash[:notice] = "Whoops something went wrong your photo did not save"
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    render :show
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photos_path
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
    params.require(:photo).permit(:title, images: [])
  end
end
