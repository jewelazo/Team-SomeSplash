class PhotosController < ApplicationController
  def new
    @photo = Photo.new(category_id: params[:category_id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to @photo
    else
      render :new
    end
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to @photo
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def search
    @photo = Photo.where(:title.matches => "%#{params[:title]}%")
    redirect_to @photo
  end

  def delete
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to category_path(@photo.category)
  end

  private

  def photo_params
    params.require[:photo].permit(:title, :description, :category_id, :image)
  end
end
